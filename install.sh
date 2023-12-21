#!/usr/bin/env bash

set -e

if [ ! -z "$GOLANG_VERSION" ]; then
    cd devcontainer/go
    dotfiles recover
fi
