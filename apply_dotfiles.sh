#!/usr/bin/env sh
set -eu

apply_dotfiles() {
  install_requirement_packages() {
    if type brew > /dev/null 2>&1; [ "${#}" -ne 0 ]; then
      printf 'Please install brew before the requirement packages for dotfiles!\n' >&2
      printf '[hint]: You should run "install_brew.sh".\n' >&2
      return 1
    fi
    brew install jq ncurses
  }

  local readonly DOTFILES_REPOSITORY='https://github.com/at0x0ft/dotfiles.git'
  local readonly DOTFILES_LOCAL_PATH="${HOME}/.dotfiles"
  local readonly DOTFILES_INSTALL_SCRIPT_PATH="${DOTFILES_LOCAL_PATH}/src/bin/install.sh"

  install_requirement_packages
  git clone "${DOTFILES_REPOSITORY}" "${DOTFILES_LOCAL_PATH}"
  ${DOTFILES_INSTALL_SCRIPT_PATH}
  return 0
}

apply_dotfiles
