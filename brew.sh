#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install cmus
brew install fzf
brew install git
brew install imagemagick
brew install mackup
brew install mplayer
brew install pandoc
brew install ranger
brew install screenfetch
brew install wget
brew install youtube-dl
brew install ffmpeg
brew install translate-shell

echo "Command line apps installed."
brew tap caskroom/versions

brew install caskroom/cask/brew-cask
# Apps
apps=(
  amethyst
  atom
  dropbox
  firefox
  flux
  google-chrome
  hazel
  imageoptim
  karabiner
  launchbar
  macvim
  monodraw
  omnidisksweeper
  pandoc
  qlmarkdown
  r-name
  sitesucker
  skype
  steam
  the-unarchiver
  transmission
  vlc
)

# Install apps to /Applications
echo "installing apps..."

apm install close-onleft ex-mode file-type-icons github-plus linter linter-csslint linter-erb linter-jshint linter-ruby native-gui relative-numbers vim-mode-plus theme-flux

brew update
brew upgrade
brew cleanup
brew cask cleanup

cd ~
echo "Finished!"
