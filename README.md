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
```

Then restart your shell or run `source ~/.bashrc`.

## neovim config

```bash
git clone https://github.com/gab-25/nvim_config ~/.config/nvim
```

## requirements

| Tool | Install method |
|------|---------------|
| net-tools, bash-completion, kubectl, k9s, helm, restic, btop, starship, ttf-jetbrains-mono-nerd, fzf, fd, ripgrep, lazygit, lazydocker, neovim, zed, rclone | pacman |
| yay | AUR (built from source) |
| ML4W Hyprland desktop | `bash <(curl -s https://ml4w.com/os/stable)` |
| docker | pacman |
| uv, poetry | official installers |
| nvm, node.js LTS | nvm |
| google-chrome | yay (AUR) |
| google-cloud-cli | yay (AUR) |
| antigravity cli | official installer |
| claude code | official installer |
