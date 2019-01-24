#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install ffmpeg
brew install mpv
brew install imagemagick
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
# npm install jslint

echo "Command line apps installed."
brew tap caskroom/versions

brew install caskroom/cask/brew-cask
# Apps
apps=(
    amethyst
    appcleaner
    atom
    dropbox
    github-desktop
    imageoptim
    macvim
    monodraw
    mpv
    PDFInfo
    r-name
    pocket-casts
    resilio-sync
    slack
    the-unarchiver
    transmission
    transmit
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
