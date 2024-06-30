#!/bin/bash

command -v git >/dev/null 2>&1 || {
  echo "git is not installed. Please install git and try again." >&2
  exit 1
}


if [ ! -d ~/.tmux/plugins/tmux-git ]; then
    git clone https://github.com/gpakosz/.tmux.git $(dirname "$0")/tmux-git
fi

ln -s ~/.config/tmux/tmux-git/.tmux.conf $(dirname "$0")/tmux.conf

