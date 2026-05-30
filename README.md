# sangjae4309_env

Personal shell and editor setup for Vim and Neovim.

## Quick install

Run:

```bash
./install.sh
```

The script backs up existing `~/.vimrc`, `~/.vim`, `~/.bashrc`, and `~/.config/nvim`, then installs the repo-managed Vim and Neovim setup.

## Clone

This repository uses a git submodule for Vundle, so clone it with:

```bash
git clone --recursive https://github.com/sangjae4309/sangjae4309_env.git
cd sangjae4309_env
```

If you already cloned it without `--recursive`, run:

```bash
git submodule update --init --recursive
```

## Vim setup

Link the Vim and shell config files:

```bash
ln -sfn "$PWD/vimrc" ~/.vimrc
ln -sfn "$PWD/bashrc" ~/.bashrc
ln -sfn "$PWD/vim" ~/.vim
```

Install Vim plugins:

```bash
vim +PluginInstall +qall
```

## Neovim setup

This repository includes a separate Neovim config under `nvim/`.

For Ubuntu or Debian, `apt install neovim` is often too old. Use the official AppImage from the Neovim releases page instead:

```bash
mkdir -p "$HOME/bin"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage "$HOME/bin/nvim"

mkdir -p ~/.config
ln -sfn "$PWD/nvim" ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

If `$HOME/bin` is not already in your `PATH`, add it in your shell config.

## Notes

- `vimrc` keeps the older Vundle-based Vim setup.
- `nvim/` is a separate Neovim config based on `lazy.nvim`.
- The Neovim config does not reuse the old Vundle setup. It is a clean Neovim-specific configuration.
- File tree: `<leader>e`
- Find files: `<leader>ff`
- Live grep: `<leader>fg`
- Open `claude` in a vertical terminal split: `<leader>c`
- Open `codex` in a vertical terminal split: `<leader>x`
- Reload your shell after linking `bashrc`:

```bash
source ~/.bashrc
```
