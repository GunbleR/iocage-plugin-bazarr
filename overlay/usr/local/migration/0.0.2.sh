#!/bin/sh

echo "Running migration for 0.0.2"

git_url="https://github.com/morpheus65535/bazarr.git"

echo "Re-init git"
rm -rf /usr/local/bazarr/.git
git -C /usr/local/bazarr init

echo "Setting git remote to ${git_url}"
git -C /usr/local/bazarr remote add origin ${git_url}

echo "Reset bazarr to latest master"
git -C /usr/local/bazarr fetch
git -C /usr/local/bazarr checkout -b master origin/master
git -C /usr/local/bazarr reset --hard origin/master

echo "Git cleanup"
git -C /usr/local/bazarr clean -f -d

echo "Installing requirements"
pip install -U -r /usr/local/bazarr/requirements.txt

echo "Cleanup"
rm -f /v0.8.4.2.tar.gz