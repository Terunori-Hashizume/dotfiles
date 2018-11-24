#!/bin/zsh

dot_dir="${HOME}/dotfiles"
cd $dot_dir
for f in .??*; do
    # ignore if matches
    [ "$f" = ".git" ] && continue
    ln -snfv ${dot_dir}/${f} ${HOME}/${f}
done
