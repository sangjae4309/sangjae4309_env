#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_ROOT="${HOME}/.config/setup-backups"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="${BACKUP_ROOT}/${TIMESTAMP}"
NVIM_APPIMAGE_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"
NVIM_BIN_DIR="${HOME}/.local/bin"
NVIM_APPIMAGE_PATH="${NVIM_BIN_DIR}/nvim.appimage"
NVIM_WRAPPER_PATH="${NVIM_BIN_DIR}/nvim"

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "missing required command: $1" >&2
    exit 1
  fi
}

backup_if_exists() {
  local target="$1"

  if [ -e "$target" ] || [ -L "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/$(basename "$target")"
    echo "backed up $target -> $BACKUP_DIR/$(basename "$target")"
  fi
}

link_file() {
  local source="$1"
  local target="$2"

  mkdir -p "$(dirname "$target")"
  ln -sfn "$source" "$target"
  echo "linked $target -> $source"
}

require_cmd git
require_cmd curl
require_cmd vim

mkdir -p "$HOME/.config" "$NVIM_BIN_DIR"

backup_if_exists "$HOME/.vimrc"
backup_if_exists "$HOME/.vim"
backup_if_exists "$HOME/.bashrc"
backup_if_exists "$HOME/.config/nvim"

link_file "$REPO_DIR/vimrc" "$HOME/.vimrc"
link_file "$REPO_DIR/vim" "$HOME/.vim"
link_file "$REPO_DIR/bashrc" "$HOME/.bashrc"
link_file "$REPO_DIR/nvim" "$HOME/.config/nvim"

echo "updating git submodules"
git -C "$REPO_DIR" submodule update --init --recursive

echo "installing Vim plugins"
vim +PluginInstall +qall

echo "installing Neovim AppImage"
rm -f "$NVIM_WRAPPER_PATH" "$NVIM_APPIMAGE_PATH"
curl -L "$NVIM_APPIMAGE_URL" -o "$NVIM_APPIMAGE_PATH"
chmod u+x "$NVIM_APPIMAGE_PATH"

cat > "$NVIM_WRAPPER_PATH" <<'EOF'
#!/usr/bin/env bash
exec "$HOME/.local/bin/nvim.appimage" "$@"
EOF
chmod u+x "$NVIM_WRAPPER_PATH"

echo "syncing Neovim plugins"
XDG_CONFIG_HOME="$HOME/.config" \
XDG_DATA_HOME="$HOME/.local/share" \
XDG_STATE_HOME="$HOME/.local/state" \
XDG_CACHE_HOME="$HOME/.cache" \
"$NVIM_WRAPPER_PATH" --headless "+Lazy! sync" +qa

echo
echo "install complete"
echo "backup directory: $BACKUP_DIR"
echo "run: source ~/.bashrc"

