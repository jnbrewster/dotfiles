#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the Dropbox/dotfiles directory to any desired dotfiles in ~/
############################

dir=~/Dropbox/dotfiles                    # dotfiles directory
olddir=~/Dropbox/dotfiles_old             # old dotfiles backup directory
files=" amethyst config muttrc nvim nvimrc profile tmux.conf vim vimrc weechat . "    # list of files/folders to symlink in homedir

echo "Linking karabiner"
ln -s ~/Dropbox/dotfiles/Karabiner/karabiner.xml ~/Library/Application\ Support/Karabiner/private.xml

echo "linking Launchbar"
ln -s ~/Dropbox/dotfiles/Launchbar/Configuration.plist ~/Library/Application\ Support/Launchbar/Configuration.plist

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
