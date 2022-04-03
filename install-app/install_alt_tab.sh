#!/usr/bin/env sh
set -eu

install_alt_tab() {
  if type brew > /dev/null 2>&1; [ "${#}" -ne 0 ]; then
    printf 'Please install brew before installing alt-tab!\n' >&2
    printf '[hint]: You should run "install_brew.sh".\n' >&2
    return 1
  fi
  brew install --cask alt-tab
  printf '[Warning]: You should launch alt-tab and do more settings.\n' >&2
  printf '[Warning]: e.g. permit accessibility, set shortcut1 to "Command + Tab", etc...\n' >&2
  return 0
}

install_alt_tab
