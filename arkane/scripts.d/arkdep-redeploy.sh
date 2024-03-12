#!/usr/bin/env zsh

cd $HOME/dotfiles/arkane

sudo arkdep-build xiorcale

imagePath=$(ls target/*.tar.zst)
image=$(echo $imagePath | cut -d "/" -f 2 | cut -d "." -f 1)

sudo mv $imagePath /arkdep/cache

sudo arkdep deploy cache $image

# cleanup target folder
sudo rm -rf target/
