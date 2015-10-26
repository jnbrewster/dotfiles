#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install tmux
brew install wget
brew install profanity
brew install cmus
brew install fish
brew install feh
brew install mutt
brew install ranger
brew install archey
brew install mplayer
brew install youtube-dl
brew install git
brew install dwm
brew install imagemagick
brew install mplayer
brew install tty-clock

brew tap caskroom/versions

pip install gcalcli
pip3 install hangups

brew cleanup

echo "Command line apps installed."

brew install caskroom/cask/brew-cask
# Apps
apps=(
	appcleaner
	amethyst
	awareness
	bittorent-sync
  dropbox
	firefox
  google-chrome
	karabiner
	launchbar
	minecraft
  nvalt
	qlmarkdown
	r-name
	sitesucker
  transmission
	vimr
  vlc
	xquartz
)

# Install apps to /Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew update
brew upgrade
brew cleanup
brew cask cleanup

cd ~
echo "Finished!"

