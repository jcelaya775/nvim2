#!/usr/bin/env bash
tmux rename-window neovim
tmux new-window
tmux select-window -t 0
nvim .
