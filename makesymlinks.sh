#!/bin/bash
############################
# Run: ./makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
prev_dir=~/_dotfiles            # old dotfiles backup directory
files="vim screens bash_history bash_logout bashrc inputrc profile screenbashrc screenbashrcgit screendefbashrc screenrc shellsrc vimrc"    # list of files/folders to symlink in homedir
just_files="mTouch.py"
#dirs="vim screens"
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
    echo "Moving any existing dotfiles from ~ to $prev_dir"
    mv ~/.$file ~/_dotfiles/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# for normal files
for file in $just_files; do
    echo "Moving any existing files from ~ to $prev_dir"
    mv ~/$file ~/_dotfiles/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# install_zsh () {
# # Test to see if zshell is installed.  If it is:
# if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
#     # Clone my oh-my-zsh repository from GitHub only if it isn't already present
#     if [[ ! -d $dir/oh-my-zsh/ ]]; then
#         git clone http://github.com/michaeljsmalley/oh-my-zsh.git
#     fi
#     # Set the default shell to zsh if it isn't currently set to zsh
#     if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
#         chsh -s $(which zsh)
#     fi
# else
#     # If zsh isn't installed, get the platform of the current machine
#     platform=$(uname);
#     # If the platform is Linux, try an apt-get to install zsh and then recurse
#     if [[ $platform == 'Linux' ]]; then
#         sudo apt-get install zsh
#         install_zsh
#     # If the platform is OS X, tell the user to install zsh :)
#     elif [[ $platform == 'Darwin' ]]; then
#         echo "Please install zsh, then re-run this script!"
#         exit
#     fi
# fi
# }
# 
# install_zsh
