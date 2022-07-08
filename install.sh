# Author arthurkiller
# email arthur-lee@qq.com
# data 2017-1-4
# this shell is used for initialize the tmux-config

#!/bin/bash

trap exit ERR
if [ -d $HOME/.tmux  ]
then
    echo The existing .tmux is backed up to .tmux.bak
    mv $HOME/.tmux $HOME/.tmux.bak
fi

if [ -e $HOME/.tmux.conf  ]
then
    echo The existing .tmux.conf is backed up to .tmux.conf.bak
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
# This gives the path to this directory (https://stackoverflow.com/a/44644933/7057866)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/.tmux.conf $HOME/.tmux.conf


tmux source-file ~/.tmux.conf
