#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the Dropbox/dotfiles directory to any desired dotfiles in ~/
############################

dir=~/Dropbox/dotfiles                    # dotfiles directory
olddir=~/Dropbox/dotfiles_old             # old dotfiles backup directory
files=" angband amethyst bash_profile bashrc config crontab hushlogin muttrc nvim nvimrc profile tmux.conf vim vimrc weechat . "    # list of files/folders to symlink in homedir

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
