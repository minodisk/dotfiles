#!/bin/bash

shopt -s dotglob
for path in $(pwd)/*; do
  base=$(basename $path)
  if [[ $base == ".git" || $base == "deploy.sh" ]]; then
    continue
  fi
  ln -fs $path ~
done
