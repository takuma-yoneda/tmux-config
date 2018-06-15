#!/bin/bash

trap exit ERR

ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
cd ~/.tmux && git submodule init && git submodule update
cd ~/.tmux/vendor/tmux-mem-cpu-load && cmake . && make && make install
# run tmux new -d if tmux daemon is not running
if [[ $(tmux ls) ]]; then
    tmux new -d
fi
tmux source-file ~/.tmux.conf
