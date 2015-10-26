#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the Dropbox/dotfiles directory to any desired dotfiles in ~/
############################

dir=~/Dropbox/dotfiles                    # dotfiles directory
olddir=~/Dropbox/dotfiles_old             # old dotfiles backup directory
files=" amethyst bashrc bash_profile config hushlogin muttrc nvim nvimrc profile pentadactylrc
tmux.conf vim vimrc xinitrc Xdefaults Xmodmap "    # list of files/folders to symlink in homedir

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Linking karabiner keybindings"
#ln -s ~/Dropbox/dotfiles/Karabiner/karabiner.xml ~/Library/Application\ Support/Karabiner/private.xml
/Applications/Karabiner.app/Contents/Library/bin/karabiner export > ~/Desktop/karabiner-import.sh

#echo "linking Launchbar files"
#ln -s ~/Dropbox/dotfiles/Launchbar/Configuration.plist ~/Library/Application\ Support/Launchbar/Configuration.plist
#ln -s ~/Dropbox/dotfiles/Launchbar/CustomShortcuts.plist ~/Library/Application\ Support/Launchbar/CustomShortcuts.plist
#ln -s ~/Dropbox/dotfiles/Launchbar/Habits.plist ~/Library/Application\ Support/Launchbar/Habits.plist

echo "Linking launchbar folder"
ln -s ~/Dropbox/dotfiles/Launchbar/ ~/Library/Application\ Support/

echo "All done!"

