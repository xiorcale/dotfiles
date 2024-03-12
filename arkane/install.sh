#!/usr/bin/env zsh

# setup custom scripts
mkdir -p $HOME/.bin

for script in $(ls scripts.d); do
    file=$(echo $script | cut -d "." -f 1)
    cp scripts.d/$script $HOME/.bin/$file
    chmod +x $HOME/.bin/$file
done

# copy zshrc 
cp .zshrc $HOME/.zshrc
source $HOME/.zshrc

# setup distrobox
distrobox assemble create

# upgrade immutable base system
sudo arkdep-redeploy
