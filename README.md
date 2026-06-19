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
cp "$DOTFILES/.vimrc"         "$HOME/.vimrc"
cp "$DOTFILES/.gitconfig"     "$HOME/.gitconfig"
cp "$DOTFILES/starship.toml"  "$HOME/.config/starship.toml"
cp "$DOTFILES/.tmux.conf"     "$HOME/.tmux.conf"
cp -r "$DOTFILES/alacritty"   "$HOME/.config/alacritty"
```

Then restart your shell or run `source ~/.bashrc`.

## tmux plugins

The tmux config uses [tpm](https://github.com/tmux-plugins/tpm). On a fresh
machine, bootstrap it and install the plugins:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
```

Inside tmux: `prefix + I` to install, `prefix + U` to update.

## neovim config

```bash
git clone https://github.com/gab-25/nvim_config ~/.config/nvim
```

## save dotfiles

Copy the dotfiles currently in use back into this repo, ready to commit
(the reverse of the "copy dotfiles" step above):

```bash
./save.sh         # save the live dotfiles into the repo
./save.sh --diff  # only show what changed, copy nothing
```

Then review with `git diff` and commit the changes.

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
