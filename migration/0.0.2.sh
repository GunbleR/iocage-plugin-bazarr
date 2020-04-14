#!/bin/sh

git_url=https://github.com/morpheus65535/bazarr.git

echo "Setting missing git remote to ${git_url}"
git -C /usr/local/bazarr remote add origin ${git_url}