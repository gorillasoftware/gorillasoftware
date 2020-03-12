#!/bin/sh

set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

bundle exec middleman build

cd build

git add .

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
  msg="$*"
fi
git commit -m "$msg"

git push origin master
