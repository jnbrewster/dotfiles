#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew tap koekeishiya/formulae
brew install koekeishiya/formulae/skhd
brew install chunkwm
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
    appcleaner
    bitbar
    dropbox
    fontplop
    hyper
    imageoptim
    kap
    launchbar
    macvim
    monodraw
    mpv
    omnifocus
    pocket-casts
    PDFInfo
    r-name
    resilio-sync
    slack
    spotify
    the-unarchiver
    transmission
    transmit
    visual-studio-code
)

# Install apps to /Applications
echo "installing apps..."

brew update
brew upgrade
brew cleanup
brew cask cleanup

ranger --copy-config=all

brew services start skhd
brew services start chunkwm

cd ~
echo "Finished!"
