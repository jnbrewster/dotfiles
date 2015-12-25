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

echo "Command line apps installed."

brew install caskroom/cask/brew-cask
# Apps
apps=(
  amethyst
  atom
  bittorrent-sync
  clipmenu
  dropbox
  firefox
  hazel
  imageoptim
  karabiner
  macvim
  monodraw
  omnidisksweeper
  pandoc
  qlmarkdown
  r-name
  sitesucker
  the-unarchiver
  transmission
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

