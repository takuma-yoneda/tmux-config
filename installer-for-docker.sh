#!/bin/bash

trap exit ERR

ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
cd ~/.tmux && git submodule init && git submodule update

# pip install instead of building it from scrach.
pip install psutil

# place it where registered in PATH
cp ~/.tmux/vendor/basic-cpu-and-memory.tmux /usr/local/bin/tmux-mem-cpu-load
chmod +x /usr/local/bin/tmux-mem-cpu-load

# run tmux new -d if tmux daemon is not running
if [[ $(tmux ls) ]]; then
    tmux new -d
fi
tmux source-file ~/.tmux.conf
