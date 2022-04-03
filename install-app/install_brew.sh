#!/usr/bin/env sh
set -eu

install_brew() {
  # TODO: handle interactive settings.
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  return 0
}

install_brew
