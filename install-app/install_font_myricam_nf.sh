#!/usr/bin/env sh
set -eu

install_font_myricam_nf() {
  if type brew > /dev/null 2>&1; [ "${#}" -ne 0 ]; then
    printf 'Please install brew before installing font-myricam-nf!\n' >&2
    printf '[hint]: You should run "install_brew.sh".\n' >&2
    return 1
  fi
  local readonly TAP_REPOSITORY_NAME='at0x0ft/my-tap'
  brew tap "${TAP_REPOSITORY_NAME}"
  brew install --cask font-myricam-nf
  return 0
}

install_font_myricam_nf
