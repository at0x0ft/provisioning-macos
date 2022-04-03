#!/usr/bin/env sh
set -eu

remap_capslock_to_command() {
  # TODO: implement later
  return 0
}

set_shortcuts() {
  # TODO: implement later
  # set "Command + Space" to IME change key.
  # set "option + R" to launch Spotlight.
  return 0
}

set_cursor_speed_fast() {
  defaults write "Apple Global Domain" com.apple.trackpad.scaling 5
  defaults write "Apple Global Domain" com.apple.mouse.scaling 10
  return 0
}

disable_dock_view() {
  defaults write com.apple.dock autohide -bool false
  defaults write com.apple.dock autohide-deley -float 0
  defaults write com.apple.dock launchanim -bool false
  return 0
}

set_theme_darkmode() {
  defaults write "Apple Global Domain" NSRequiresAquaSystemAppearance -bool true
  return 0
}

set_animations_fast() {
  defaults write "Apple Global Domain" NSAutomaticWindowAnimationEnabled -bool false
  defaults write "Apple Global Domain" NSInitialToolTipDelay -integer 0
  defaults write "Apple Global Domain" NSWindowResizeTime -float 0.001
  return 0
}

set_always_view_scroll_bars() {
  defaults write "Apple Global Domain" AppleShowScrollBars -string "Always"
  return 0
}

set_all_files_visible() {
  defaults write "Apple Global Domain" AppleShowAllExtensions -bool true
  return 0
}

disable_DSStore() {
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
  return 0
}

set_finder_appearance() {
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
  defaults write com.apple.finder DisableAllAnimations -bool true
  defaults write com.apple.finder AnimateWindowZoom -bool false
  defaults write com.apple.finder AppleShowAllFiles YES
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  defaults write com.apple.finder ShowTabView -bool true
  return 0
}

set_screenshot_fileext() {
  defauls write com.apple.screencapture type png
  return 0
}

remap_capslock_to_command
set_shortcuts
set_cursor_speed_fast
disable_dock_view
set_theme_darkmode
set_animations_fast
set_always_view_scroll_bars
set_all_files_visible
disable_DSStore
set_finder_appearance
set_screenshot_fileext
