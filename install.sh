#!/usr/bin/env bash
# Install command-line tools using Homebrew.

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”≤

brew update
brew upgrade --all

brew install tmux
brew tap neovim/neovim
brew install --HEAD neovim
brew install weechat
brew install profanity
brew install cmus
brew install mutt
brew install ranger
brew cask install qlmarkdown


#Install rails stuff
brew install rbenv
brew install ruby-build
rbenv install 2.2.2
rbenv global 2.2.2

brew cleanup

#Make fish default shell
chsh -s /usr/local/bin/fish

echo "Command line apps installed."

brew install caskroom/cask/brew-cask
# Apps
apps=(
	amethyst
  dropbox
  google-chrome
	github-desktop
	karabiner
	launchbar
	steam
  flux
  vlc
  nvalt
	r-name
	sitesucker
  transmission
	vimr
	macvim
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

cd ~
echo "Finished!"

