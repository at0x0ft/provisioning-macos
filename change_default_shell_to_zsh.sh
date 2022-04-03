#!/usr/bin/env sh
set -eu

change_default_shell_to_zsh() {
  # TODO: handle sudo password.
  chsh -s $(which zsh)
  return 0
}

change_default_shell_to_zsh
