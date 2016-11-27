#!/bin/bash

REPO_INDEX="repo_index"

cat "$REPO_INDEX" \
  | while read url ; do
      git clone "$url"
    done
