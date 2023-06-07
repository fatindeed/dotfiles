#!/usr/bin/env bash

set -e

# Download and save dotfiles to ~/.local/bin automatically
# if [ ! -f $HOME/.local/bin/dotfiles ]; then
#     DOTFILES_CACHE_DIR=${DOTFILES_CACHE_DIR:-/vscode}
#     DOTFILES_CACHE_FILE=dotfiles-$(go env GOOS)-$(go env GOARCH)
#     if [ ! -f $DOTFILES_CACHE_DIR/$DOTFILES_CACHE_FILE ]; then
#         pushd $DOTFILES_CACHE_DIR
#         curl -LO https://github.com/fatindeed/dotfiles-go/releases/latest/download/$DOTFILES_CACHE_FILE
#         popd
#     fi
#     mkdir -p $HOME/.local/bin
#     cp $DOTFILES_CACHE_DIR/$DOTFILES_CACHE_FILE $HOME/.local/bin/dotfiles
#     chmod +x $HOME/.local/bin/dotfiles
# fi

cd $(dirname $0)
dotfiles recover