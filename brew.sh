#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install tmux
brew install wget
brew install profanity
brew install cmus
brew install mutt
brew install ranger
brew install mplayer
brew install youtube-dl
brew install git
brew install imagemagick
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
	bittorent-sync
	firefox
  dropbox
  google-chrome
	honer
	karabiner
  nvalt
	qlmarkdown
	r-name
	sitesucker
  transmission
	vimr
  vlc
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

