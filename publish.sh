#!/bin/sh
cd $(dirname $(pwd)/$0)

if [ ! -d blog ]; then
    mkdir blog
fi
cp -p blog.src/*.org blog/

if [ ! -d draft-blog ]; then
    mkdir draft-blog
fi
cp -p draft-blog.src/*.org draft-blog/

emacs --batch --script publish.el

rm -f blog/*.org
