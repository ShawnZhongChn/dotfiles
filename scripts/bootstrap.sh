#!/bin/sh

set -eu

HOME_DIR="${HOME}"
DOTFILES_DIR="${HOME_DIR}/dotfiles"

mkdir -p \
  "${HOME_DIR}/.config" \
  "${HOME_DIR}/.cache/zsh" \
  "${HOME_DIR}/.config/git" \
  "${HOME_DIR}/.local/bin" \
  "${HOME_DIR}/.local/share" \
  "${HOME_DIR}/.local/state/tmux/resurrect" \
  "${HOME_DIR}/.local/state/zsh"

link_file() {
  src="$1"
  dest="$2"

  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -e "$dest" ]; then
    backup="${dest}.pre-dotfiles"
    if [ ! -e "$backup" ]; then
      mv "$dest" "$backup"
    else
      echo "Refusing to overwrite $dest because $backup already exists." >&2
      exit 1
    fi
  fi

  ln -s "$src" "$dest"
}

link_file "${DOTFILES_DIR}/home/.zprofile" "${HOME_DIR}/.zprofile"
link_file "${DOTFILES_DIR}/home/.zshrc" "${HOME_DIR}/.zshrc"
link_file "${DOTFILES_DIR}/home/.zshenv" "${HOME_DIR}/.zshenv"

mkdir -p "${HOME_DIR}/.config/zsh"
link_file "${DOTFILES_DIR}/config/zsh/.zprofile" "${HOME_DIR}/.config/zsh/.zprofile"
link_file "${DOTFILES_DIR}/config/zsh/.zshrc" "${HOME_DIR}/.config/zsh/.zshrc"

link_file "${DOTFILES_DIR}/config/tmux/tmux.conf" "${HOME_DIR}/.tmux.conf"
link_file "${DOTFILES_DIR}/config/tmux" "${HOME_DIR}/.config/tmux"
link_file "${DOTFILES_DIR}/config/git/config" "${HOME_DIR}/.gitconfig"
link_file "${DOTFILES_DIR}/config/lazygit" "${HOME_DIR}/.config/lazygit"
link_file "${DOTFILES_DIR}/config/ghostty" "${HOME_DIR}/.config/ghostty"

echo "dotfiles bootstrap complete"
