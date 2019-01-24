#!/bin/sh

echo "Installing Homebrew..."
if which brew 2>/dev/null 1>/dev/null; then
    echo "Homebrew already installed."
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo "Installing brew apps"
sh brew.sh

echo "Making symlinks"
sh symlinks.sh

cd ~
echo "Finished!"
echo " "

