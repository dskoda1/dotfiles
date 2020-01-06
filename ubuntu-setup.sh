#!/bin/sh
# Installs
apt-get update
apt-get install zsh
apt-get install fonts-powerline
apt-get install ttf-ancient-fonts
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && mv zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins
