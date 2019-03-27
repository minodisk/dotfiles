#!/bin/bash

files="
  .config/alacritty/alacritty.yml
  .config/nvim/init.vim
  .config/tmux/tmuxline.conf
  .spacemacs
  .tmux.conf
  .zshrc
"

for f in $files; do
  from=$(pwd)/$f
  to=$HOME/$f
  cmd="ln -fs $from $to"
  echo "exec '$cmd'"
  mkdir -p $(dirname $to)
  eval $cmd
done
