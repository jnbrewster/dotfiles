#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

# brew install --devel elinks
# brew install atool
# brew install cmus
# brew install ffmpeg
# brew install fzf
brew install git
# brew install highlight
# brew install imagemagick
# brew install libcaca --with-imlib2
brew install mplayer
# brew install mutt
# brew install pandoc
brew install ranger
# brew install screenfetch
brew install translate-shell
brew install wget
brew install youtube-dl

npm install jslint

echo "Command line apps installed."
brew tap caskroom/versions

brew install caskroom/cask/brew-cask
# Apps
apps=(
  # amethyst
  # bartender
  dropbox
  # firefox
  github-desktop
  google-chrome
  # hazel
  imageoptim
  launchbar
  macvim
  monodraw
  mplayerx
  omnidisksweeper
  # pandoc
  # pdftotext
  # phoenix
  # qlmarkdown
  r-name
  sitesucker
  slack
  the-unarchiver
  transmission
  # tunnelbear
)

# Install apps to /Applications
echo "installing apps..."

brew update
brew upgrade
brew cleanup
brew cask cleanup

cd ~
echo "Finished!"
