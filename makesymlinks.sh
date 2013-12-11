#!/bin/bash
############################
# Run: ./makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
prev_dir=~/_dotfiles            # old dotfiles backup directory

files="vim screens bash_history bash_logout bashrc inputrc profile screenbashrc screenbashrcgit screendefbashrc screenrc vimrc"    # list of files/folders to symlink in homedir
just_files="mTouch.py"
##########

# create dotfiles_old in homedir
echo -n "Creating $prev_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $prev_dir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
# this also includes dot-directories. 
for file in $files; do
    echo "Moving existing dotfile .$file from ~ to $prev_dir"
    mv ~/.$file ~/_dotfiles/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# for normal files
for file in $just_files; do
    echo "Moving existing file $file from ~ to $prev_dir"
    mv ~/$file ~/_dotfiles/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

