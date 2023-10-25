#! /bin/bash
# setup.sh
# This is a setup script

# files and directories to back up

# allows use of the config command for backing up via git bare 
function config {
  /usr/bin/git --git-dir=$HOME/Code/dotfiles/ --work-tree=$HOME "$@" 
} 

# update system
if grep -q "arch" /etc/os-release
then 
    sudo pacman -Syu
fi
if grep -q "debian" /etc/os-release
then 
    echo "Running system update"
    sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
fi

# change git branch 
if grep -q "arch" /etc/os-release
then 
    git checkout Anomaly-Engine
fi
if grep -q "debian" /etc/os-release
then 
    git checkout popLaptop
    # git checkout Portable-Dev
fi

echo "Coping bashrc"
# cp .bashrc ~
 
cd .config 
echo "Coping .config dotfiles"
cp * ~/.config


echo "Creating dotfiles git bare repo"

# if [ -d ~/dotfiles ]
# then 
# fi

echo "Creating dotfiles git bare repo directory"
mkdir $HOME/Code/dotfiles/ 
cd $HOME/Code/dotfiles/ 
# initiialize bare repo
echo "Initiialize bare repo"
git init --bare
# use this to avoid it showing all of the "untracked files"
config  config --local status.showUntrackedFiles no

hostname=`hostname`
git branch -m "$hostname"

config remote add origin git@github.com:Zachary-Blundell/dotfiles.git

config push --set-upstream origin $hostname

# need to create a loop for adding each of the things that I backup 
directories="
calibre
flameshot
i3
i3status
joplin
Joplin
joplin
lvim
nvim
polybar
rofi
tmux"

files="
compton.conf 
starship.toml"

# start by adding .bashrc
# config add ~/.bashrc
# config commit -m "first commit"
# cd ~/.config
# for directory in $directories
# do
#     echo "adding " $directory;
#     cd 
# done

