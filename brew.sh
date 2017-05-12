#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install ffmpeg
brew install mpv
brew install node
brew install python3
brew install ranger
brew install the_silver_searcher
brew install tmux
brew install translate-shell
brew install wget
brew install youtube-dl
brew install --devel elinks

# brew install highlight
# brew install imagemagick
# npm install jslint

echo "Command line apps installed."
brew tap caskroom/versions

brew install caskroom/cask/brew-cask
# Apps
apps=(
  appcleaner
  atom
  dropbox
  github-desktop
  google-chrome
  imageoptim
  keepingyouawake
  macvim
  monodraw
  mpv
  slack
  the-unarchiver
  transmission
  transmit
  tunnelbear
)

# Install apps to /Applications
echo "installing apps..."

brew update
brew upgrade
brew cleanup
brew cask cleanup

ranger --copy-config=all

cd ~
echo "Finished!"
