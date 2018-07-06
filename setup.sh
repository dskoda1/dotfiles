#!/usr/bin/zsh
mkdir -p ~/.vim
cp -r ~/dotfiles/colors ~/.vim/
cp bashrc ~/.bashrc
cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig

# Change this line to configure what terminal you want by default
source ~/.zshrc
