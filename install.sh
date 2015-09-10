#!/usr/bin/env bash
# Install command-line tools using Homebrew.

ruby -e $"(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

brew install tmux
brew install weechat
brew install profanity
brew install cmus
brew install fish
brew install mutt
brew install ranger
brew install archey
brew install homebrew/games/angband
brew install mplayer
brew install youtube-dl

pip install glances

##Install rails stuff
#brew install rbenv
#brew install ruby-build
#rbenv install 2.2.2
#rbenv global 2.2.2
#brew install heroku

brew cleanup

#Make fish default shell
chsh -s /usr/local/bin/fish

echo "Command line apps installed."

brew install caskroom/cask/brew-cask
# Apps
apps=(
	amethyst
	spectacle
  dropbox
	firefox
  google-chrome
	github-desktop
	karabiner
	launchbar
  vlc
  nvalt
	r-name
	sitesucker
  transmission
	vimr
	qlmarkdown
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew tap caskroom/fonts
# fonts
fonts=(
	font-source-code-pro
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# Setup mac settings
echo "setting up mac preferences..."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
chflags nohidden ~/Library
defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true

for app in Finder Dock SystemUIServer; do killall "$app" >/dev/null 2>&1; done

cd ~
echo "Finished!"

