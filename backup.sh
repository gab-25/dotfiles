#!/usr/bin/env bash
set -euo pipefail

# Backup the home folder with restic.
#
# Password handling (first match wins):
#   1. $RESTIC_PASSWORD            — set in the environment
#   2. $RESTIC_PASSWORD_FILE       — path to a file holding the password
#   3. ~/.config/restic/password   — default password file, if it exists
#   4. interactive prompt          — restic asks on the terminal
#
# Usage:
#   ./backup.sh            # run the backup
#   ./backup.sh --prune    # run the backup, then apply the retention policy

info() { echo "[INFO] $*"; }
success() { echo "[OK]   $*"; }
skip() { echo "[SKIP] $*"; }

export RESTIC_REPOSITORY="${RESTIC_REPOSITORY:-$HOME/backups/restic-repo}"

# Pick up a default password file if neither password var is already set.
DEFAULT_PW_FILE="$HOME/.config/restic/password"
if [ -z "${RESTIC_PASSWORD:-}" ] && [ -z "${RESTIC_PASSWORD_FILE:-}" ] && [ -f "$DEFAULT_PW_FILE" ]; then
  export RESTIC_PASSWORD_FILE="$DEFAULT_PW_FILE"
fi

EXCLUDES=(
  --exclude "$HOME/.cache"
  --exclude "$HOME/backups"
  --exclude "$HOME/.local/share/Trash"
  --exclude "**/node_modules"
  --exclude "**/.venv"
  --exclude "**/__pycache__"
)

# Retention policy used with --prune.
RETENTION=(
  --keep-daily 7
  --keep-weekly 4
  --keep-monthly 6
)

if [ ! -f "$RESTIC_REPOSITORY/config" ]; then
  echo "[ERR]  No restic repository found at $RESTIC_REPOSITORY" >&2
  echo "       Initialize it first with: restic init" >&2
  exit 1
fi

info "Backing up $HOME -> $RESTIC_REPOSITORY"
restic backup "$HOME" \
  --verbose \
  --one-file-system \
  --tag home \
  "${EXCLUDES[@]}"
success "Backup complete"

if [ "${1:-}" = "--prune" ]; then
  info "Applying retention policy and pruning..."
  restic forget --prune --tag home "${RETENTION[@]}"
  success "Prune complete"
fi

info "Current snapshots:"
restic snapshots --tag home
