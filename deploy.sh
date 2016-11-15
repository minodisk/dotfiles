shopt -s dotglob
for f in $(pwd)/*; do
  ln -fs $f ~
done
