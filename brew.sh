#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update
brew upgrade --all

brew install tmux
brew tap neovim/neovim
brew install --HEAD neovim
brew install bash
brew install fish
brew install wget --with-iri
brew install weechat
brew install profanity
brew install cmus
brew install mutt
brew install ranger
brew install python
brew install rbenv
brew install ruby-build

brew cleanup

echo "Command line apps installed."

pip install mackup

brew install caskroom/cask/brew-cask
# Apps
apps=(
	amethyst
	appcleaner
	bettertouchtool
  dropbox
  google-chrome
	github-desktop
	karabiner
	launchbar
	steam
  virtualbox
  flux
  vlc
  nvalt
	r-name
	sitesucker
  transmission
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

echo "Don't forget to log into dropbox and run 'mackup restore!'"
