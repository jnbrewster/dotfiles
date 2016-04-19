#!/usr/bin/env bash
# Install command-line tools using Homebrew.

brew update

brew install cmus
brew install --devel elinks
brew install fzf
brew install git
brew install imagemagick
brew install homebrew/binary/kwm
brew install mackup
brew install mplayer
brew install mutt
brew install pandoc
brew install poppler
brew install ranger
brew install screenfetch
brew install wget
brew install youtube-dl
brew install ffmpeg
brew install translate-shell
brew install atool
brew install highlight
brew install libcaca --with-imlib2
brew install /Caskroom/cask/xquartz

pip install rtv

echo "Command line apps installed."
brew tap caskroom/versions

brew install caskroom/cask/brew-cask
# Apps
apps=(
  amethyst
  atom
  bartender
  dropbox
  firefox
  github-desktop
  google-chrome
  hazel
  imageoptim
  launchbar
  macvim
  monodraw
  mplayerx
  omnidisksweeper
  omnifocus
  pandoc
  pdftotext
  pocketcast
  qlmarkdown
  r-name
  sitesucker
  skype
  steam
  the-unarchiver
  transmission
  tunnelbear
)

# Install apps to /Applications
echo "installing apps..."

#apm install close-onleft ex-mode file-type-icons github-plus linter linter-csslint linter-erb linter-jshint linter-ruby native-gui relative-numbers vim-mode-plus theme-flux

# Download imgcar to ~/bin
#wget -O ~/bin/imgcat https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat

# Download imgcar to /usr/local/bin (requires sudo)
#sudo wget -O /usr/local/bin/imgcat https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat

brew update
brew upgrade
brew cleanup
brew cask cleanup

pip install rtv

cd ~
echo "Finished!"
