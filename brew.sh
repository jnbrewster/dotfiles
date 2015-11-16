#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install cmus
brew install git
brew install imagemagick
brew install mplayer
brew install neovim/neovim/neovim
brew install profanity
brew install ranger
brew install tmux
brew install tty-clock
brew install wget
brew install youtube-dl

echo "Command line apps installed."

brew install caskroom/cask/brew-cask
# Apps
apps=(
	amethyst
	appcleaner
	bittorent-sync
	firefox
	honer
	karabiner
	qlmarkdown
	r-name
	sitesucker
	vimr
  dropbox
  google-chrome
  nvalt
  transmission
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

