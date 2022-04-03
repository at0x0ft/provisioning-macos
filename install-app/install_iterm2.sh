#!/usr/bin/env sh
set -eu

install_iterm2() {
  if type brew > /dev/null 2>&1; [ "${#}" -ne 0 ]; then
    printf 'Please install brew before installing iterm2!\n' >&2
    printf '[hint]: You should run "install_brew.sh".\n' >&2
    return 1
  fi
  brew install --cask iterm2
  # TODO: set iterm2 profile from command line...
  printf '[Warning]: You should launch iterm2 and do more settings.\n' >&2
  printf '[Warning]: e.g. setting font (e.g. MyricaM NF), setting window transparency (30%), etc...\n' >&2
  return 0
}

install_iterm2
