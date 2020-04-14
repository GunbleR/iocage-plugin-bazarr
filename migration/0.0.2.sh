#!/bin/sh

set -e

git_url=https://github.com/morpheus65535/bazarr.git

echo "Init git if needed"
git -C /usr/local/bazarr init

echo "Setting missing git remote to ${git_url}"
git -C /usr/local/bazarr remote set-url origin ${git_url}

echo "Reset bazarr to latest master"
git -C /usr/local/bazarr fetch
git -C /usr/local/bazarr branch --set-upstream-to=origin/master master
git -C /usr/local/bazarr reset --hard origin/master
git -C /usr/local/bazarr clean -f -d

echo "Installing requirements"
pip install -U -r /usr/local/bazarr/requirements.txt