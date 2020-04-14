#!/bin/sh

set -e

git_url=https://github.com/morpheus65535/bazarr.git

echo "Re-init git if needed"
rm -rf /usr/local/bazarr/.git
git -C /usr/local/bazarr init

echo "Setting missing git remote to ${git_url}"
git -C /usr/local/bazarr remote add origin ${git_url}

echo "Reset bazarr to latest master"
git -C /usr/local/bazarr fetch
git -C /usr/local/bazarr checkout -b master origin/master
git -C /usr/local/bazarr reset --hard origin/master
git -C /usr/local/bazarr clean -f -d

echo "Installing requirements"
pip install -U -r /usr/local/bazarr/requirements.txt