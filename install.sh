#!/bin/sh
set -e

# Install Homebrew
if [ ! -f /usr/local/bin/brew ]
 then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
 else
  echo "Homebrew already installed."
fi

brew bundle
curl https://get.volta.sh | bash

mkdir -p ~/.config
mkdir -p ~/.config/nvim
stow -R -v -d ./ -t ~/.config starship
stow -R -v -d ./ -t ~/.config/nvim neovim

mkdir -p ~/.vivaldi
stow -R -v -d ./ -t ~/.vivaldi vivaldi

mkdir -p ~/.vim
mkdir -p ~/.vim/tsnip
stow -R -v -d ./ -t ~/.vim/tsnip tsnip

mkdir -p ~/git
stow -R -v -d ./ -t ~/git git
git config --global core.excludesfile ~/git/.gitignore_global

if unlink ~/Library/Application\ Support/AquaSKK; then
  echo "Unlinked AquaSKK. linking..."
else
  echo "AquaSKK not linked. linking..."
fi
if unlink ~/.skk; then
  echo "Unlinked dotSKK. linking..."
else
  echo "dotSKK not linked. linking..."
fi
ln -s ~/repos/dotfiles-mac/AquaSKK ~/Library/Application\ Support/
ln -s ~/repos/dotfiles-mac/AquaSKK ~/.skk

