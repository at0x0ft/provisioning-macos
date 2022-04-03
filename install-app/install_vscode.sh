#!/usr/bin/env sh
set -eu

install_vscode() {
  if type brew > /dev/null 2>&1; [ "${#}" -ne 0 ]; then
    printf 'Please install brew before installing Visual Studio Code!\n' >&2
    printf '[hint]: You should run "install_brew.sh".\n' >&2
    return 1
  fi
  brew install --cask visual-studio-code
  return 0
}

install_vscode
