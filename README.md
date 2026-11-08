# dotfiles

My personal dotfiles

## install

```bash
./install.sh
```

## copy dotfiles

After running `install.sh`, copy the dotfiles into place:

```bash
DOTFILES="$(pwd)"
cp "$DOTFILES/.bashrc"        "$HOME/.bashrc"
cp "$DOTFILES/.gitconfig"     "$HOME/.gitconfig"
cp "$DOTFILES/starship.toml"  "$HOME/.config/starship.toml"
mkdir -p "$HOME/.config" && cp -r "$DOTFILES/herdr-app" "$HOME/.config/"
```

Then restart your shell or run `source ~/.bashrc`.

## tailscale

`install.sh` installs Tailscale but does not log in. Connect the machine
to the tailnet with:

```bash
sudo tailscale up
```

## neovim config

The Neovim config lives in its own repo,
[gab-25/nvim_config](https://github.com/gab-25/nvim_config). After running
`install.sh`, clone it into `~/.config/nvim`:

```bash
git clone https://github.com/gab-25/nvim_config.git "$HOME/.config/nvim"
git -C "$HOME/.config/nvim" remote set-url --push origin git@github.com:gab-25/nvim_config.git
```

The first time `nvim` starts, lazy.nvim installs the plugins pinned in
`lazy-lock.json`.

## save dotfiles

Copy the dotfiles currently in use back into this repo, ready to commit
(the reverse of the "copy dotfiles" step above):

```bash
./save.sh         # save the live dotfiles into the repo
./save.sh --diff  # only show what changed, copy nothing
```

Then review with `git diff` and commit the changes.

## update

Update the installed packages:

```bash
./update.sh               # update apt, homebrew and flatpak
./update.sh --apt --brew  # only the package managers listed
./update.sh --no-cleanup  # skip the cleanup steps
```

Package managers that are not installed are skipped. Unless
`--no-cleanup` is passed, the script also runs `apt-get autoremove`,
`brew cleanup` and `flatpak uninstall --unused`.

apt and flatpak need root, so the sudo password is asked once at the
start and the credentials are kept alive for the rest of the run (with
`--brew` alone it is never asked). Homebrew runs last on purpose: every
`brew` command resets the sudo timestamp, which would make the steps
after it ask for the password again.

## backup

Back up the home folder with [restic](https://restic.net/):

```bash
./backup.sh          # run the backup
./backup.sh --prune  # run the backup, then apply the retention policy
```

The repository defaults to `~/restic-repo` (override with
`RESTIC_REPOSITORY`). Set the password via `RESTIC_PASSWORD`,
`RESTIC_PASSWORD_FILE`, or `~/.config/restic/password`. Initialize the
repository first with `restic init`.
