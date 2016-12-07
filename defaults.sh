#!/bin/bash

# Setup mac settings
echo "setting up mac preferences..."

# Global settings
#shorter key delay
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write com.apple.finder WarnOnEmptyTrash -bool false

#defaults read -g | grep AppleHighlightColor
## Set highlight color to graphite
defaults write NSGlobalDomain AppleHighlightColor -string "0.847059 0.847059 0.862745"

## Use Graphite color theme
defaults write NSGlobalDomain AppleAquaColorVariant 6

## Use Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
sudo defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThem

## Show scrollbars when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Finder / File Panels

## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

## Hide icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

## Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Open everything in Finder's list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Search only within the current directory
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Save to disk (rather than iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


## Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Dock

## Hide the Dock
defaults write com.apple.dock autohide -bool true

## Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Menu Bar

## Hide the Menu Bar

defaults write "Apple Global Domain" "_HIHideMenuBar" 1

# Desktop / Screensaver

## Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

## Show the ~/Library folder
chflags nohidden ~/Library

## Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Accessibility

# Safari

## Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

## Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true

## Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

### Set my Startpage as favorites

defaults write com.apple.Safari "Favorites"
defaults write com.apple.Safari "NewTabBehavior" 0
defaults write com.apple.Safari "NewWindowBehavior" 0

killall Finder
killall Safari
killall Dock
