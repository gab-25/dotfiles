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
