#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install cmus
brew install fzf
brew install git
brew install imagemagick
brew install mplayer
brew install pandoc
brew install ranger
brew install screenfetch
brew install tmux
brew install tty-clock
brew install w3m
brew install wget
brew install youtube-dl
brew install ffmpeg
brew install node.js
npm install -g jshint

echo "Command line apps installed."
brew tap caskroom/versions

brew install caskroom/cask/brew-cask
# Apps
apps=(
  amethyst
  appcleaner
  atom
  bittorrent-sync
  dropbox
  firefox
  google-chrome
  hazel
  imageoptim
  iterm2-beta
  karabiner
  launchbar
  macvim
  monodraw
  omnidisksweeper
  pandoc
  qlmarkdown
  r-name
  sitesucker
  steam
  the-unarchiver
  transmission
  ubersicht
  vlc
)

# Install apps to /Applications
echo "installing apps..."

brew update
brew upgrade
brew cleanup
brew cask cleanup

cd ~
echo "Finished!"

