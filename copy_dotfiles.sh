#!/bin/bash

# Copy dotfiles to git repo

repo="$HOME/Projects/dotfiles_v2/"

# System
cp $HOME/.Xresources $repo
cp $HOME/.bash_profile $repo
cp $HOME/.bashrc $repo
cp $HOME/.xinitrc $repo
cp $HOME/.vimrc $repo

# Polybar
cp -r $HOME/.config/polybar/* $repo.config/polybar/

# i3-gaps
cp -r $HOME/.config/i3/* $repo.config/i3/

# Rofi
cp -r $HOME/.config/rofi/* $repo.config/rofi/

# Picom
cp -r $HOME/.config/picom/* $repo.config/picom/

# Discocss
cp -r $HOME/.config/discocss/* $repo.config/discocss/

# Firefox
profile="$(ls -alh $HOME/.mozilla/firefox/ | grep default-release | awk '{print $NF}')"
cp -r $HOME/.mozilla/firefox/$profile/chrome/* $repo.mozilla/firefox/XXXXX.default-release/chrome/

# GLava
cp -r $HOME/.config/glava/* $repo.config/glava/

echo "Dotfiles copied, ready to commit/push."



