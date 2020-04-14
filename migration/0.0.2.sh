#!/bin/sh

git_url=https://github.com/morpheus65535/bazarr.git

echo "Setting missing git remote to ${git_url}"
git -C /usr/local/bazarr remote set-url origin ${git_url}
git -C /usr/local/bazarr fetch
git -C /usr/local/bazarr reset --hard origin/master

echo "Installing requirements"
pip install -U -r /usr/local/bazarr/requirements.txt