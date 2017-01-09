#!/bin/bash

REPO_INDEX="repo_index"
mkdir -p vim/bundle

cat "$REPO_INDEX" \
  | while read url ; do
      pushd vim/bundle
      git clone "$url" 
      popd
    done

mkdir vim/autoload
cp vim/bundle/vim-pathogen/autoload/pathogen.vim vim/autoload
