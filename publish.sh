#!/bin/sh
cd $(dirname $(pwd)/$0)

if [ ! -d blog-gen ]; then
    mkdir blog-gen
fi
cp -p blog/*.org blog-gen/

emacs --batch --script publish.el

rm -f blog-gen/*.org
