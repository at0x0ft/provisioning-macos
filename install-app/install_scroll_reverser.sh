#!/usr/bin/env sh
set -eu

install_scroll_reverser() {
  if type brew > /dev/null 2>&1; [ "${#}" -ne 0 ]; then
    printf 'Please install brew before installing scroll-reverser!\n' >&2
    printf '[hint]: You should run "install_brew.sh".\n' >&2
    return 1
  fi
  brew install --cask scroll-reverser
  printf '[Warning]: You should launch scroll-reverser and do more settings.\n' >&2
  printf '[Warning]: e.g. permit accessibility, set "launch when logging in, etc...".\n' >&2
  return 0
}

install_scroll_reverser
