#!/usr/bin/env bash

# Mac OS X configuration
#
# This configuration applies to the latest version of Mac OS X (currently
# 10.10.1), and sets up preferences and configurations for all the built-in
# services and apps. Third-party app config should be done elsewhere.
#
# Options:
#   --no-restart: Don't restart any apps or services after running the script.
#
# @see: http://secrets.blacktree.com/?showapp=com.apple.finder
#
# @author Jeff Geerling, 2014

# Warn that some commands will not be run if the script is not run as root.
if [[ $EUID -ne 0 ]]; then
  RUN_AS_ROOT=false
  printf "Certain commands will not be run without sudo privileges. To run as root, run the same command prepended with 'sudo', for example: $ sudo $0\n\n" | fold -s -w 80
else
  RUN_AS_ROOT=true
  # Update existing `sudo` timestamp until `.osx` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
# defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Add iOS Simulator to Applications folder.
if [[ "$RUN_AS_ROOT" = true ]]; then
  sudo ln -sf /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app /Applications/Simulator.app
fi

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Bottom right screen corner → Mission Control
#defaults write com.apple.dock wvous-br-corner -int 2
#defaults write com.apple.dock wvous-br-modifier -int 0
# Top right screen corner → Put display to sleep
defaults write com.apple.dock wvous-tr-corner -int 10
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Desktop
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

printf "Please log out and log back in to make all settings take effect.\n"