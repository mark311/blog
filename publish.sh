#!/bin/sh
cd $(dirname $(pwd)/$0)

if [ ! -d blog ]; then
    mkdir blog
fi
cp -p blog-src/*.org blog/

emacs --batch --script publish.el

rm -f blog/*.org
