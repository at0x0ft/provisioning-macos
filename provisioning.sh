#!/usr/bin/env sh
set -eu

provisioning() {
  # ref: https://github.com/ko1nksm/readlinkf/blob/master/readlinkf.sh
  readlinkf() {
    [ "${1:-}" ] || return 1
    max_symlinks=40
    CDPATH='' # to avoid changing to an unexpected directory

    target=$1
    [ -e "${target%/}" ] || target=${1%"${1##*[!/]}"} # trim trailing slashes
    [ -d "${target:-/}" ] && target="$target/"

    cd -P . 2>/dev/null || return 1
    while [ "$max_symlinks" -ge 0 ] && max_symlinks=$((max_symlinks - 1)); do
      if [ ! "$target" = "${target%/*}" ]; then
        case $target in
          /*) cd -P "${target%/*}/" 2>/dev/null || break ;;
          *) cd -P "./${target%/*}" 2>/dev/null || break ;;
        esac
        target=${target##*/}
      fi

      if [ ! -L "$target" ]; then
        target="${PWD%/}${target:+/}${target}"
        printf '%s\n' "${target:-/}"
        return 0
      fi

      # `ls -dl` format: "%s %u %s %s %u %s %s -> %s\n",
      #   <file mode>, <number of links>, <owner name>, <group name>,
      #   <size>, <date and time>, <pathname of link>, <contents of link>
      # https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html
      link=$(ls -dl -- "$target" 2>/dev/null) || break
      target=${link#*" $target -> "}
    done
    return 1
  }

  local readonly SCRIPT_PATH=$(readlinkf "${0}")
  local readonly SCRIPT_ROOT=$(dirname -- "${SCRIPT_PATH}")
  local readonly INSTALL_APP_SCRIPTS_DIRECTORY="${SCRIPT_ROOT}/install-app"

  "${SCRIPT_ROOT}/"set_preferences.sh
  "${INSTALL_APP_SCRIPTS_DIRECTORY}/"install_brew.sh
  "${INSTALL_APP_SCRIPTS_DIRECTORY}/"install_font_myricam_nf.sh
  "${INSTALL_APP_SCRIPTS_DIRECTORY}/"install_alt_tab.sh
  "${INSTALL_APP_SCRIPTS_DIRECTORY}/"install_scroll_reverser.sh
  "${INSTALL_APP_SCRIPTS_DIRECTORY}/"install_scroll_slack.sh
  "${INSTALL_APP_SCRIPTS_DIRECTORY}/"install_scroll_iterm2.sh
  "${INSTALL_APP_SCRIPTS_DIRECTORY}/"install_vscode.sh
  "${SCRIPT_ROOT}/"change_default_shell_to_zsh.sh
  "${SCRIPT_ROOT}/"apply_dotfiles.sh
  return 0
}
provisioning
