#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install cmus
brew install git
brew install imagemagick
brew install mplayer
brew install neovim/neovim/neovim
brew install pandoc
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
  clipmenu
  firefox
  google-chrome
  honer
  karabiner
  nvalt
  qlmarkdown
  r-name
  sitesucker
  transmission
  unpkg
  vimr
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

