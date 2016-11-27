#!/bin/bash

BUNDLE_DIR="vim/bundle"
REPO_INDEX=repo_index
TMP_REPO_INDEX=repo_index.tmp

rm -f "$TMP_REPO_INDEX"

cloned_plugins=$( find "$BUNDLE_DIR" -mindepth 1 -maxdepth 1 -type d -exec test -e "{}/.git/config" \; -print )

echo "$TMP_REPO_INDEX" > .gitignore
echo "vim/bundle/.netwrist" > .gitignore
echo "vim/bundle/.VimballRecord" > .gitignore

for plugin in $cloned_plugins ; do
  sed -n '/^\[remote "origin"\]/,$p' "$plugin"/.git/config \
  | awk -F= '/url =/ { print $2 }' \
  | cut -c 2- >> "$TMP_REPO_INDEX"

  echo "$plugin" >> .gitignore
done

mv "$TMP_REPO_INDEX" "$REPO_INDEX"

