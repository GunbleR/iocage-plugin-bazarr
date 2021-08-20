#!/bin/sh

echo "Running migration for 0.3.0"

# quickfix before index portback
pkg install -y unzip
pkg delete -y git-lite

echo "Fetch ZIP"
fetch https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip

echo "Unzip bazarr archive"
unzip -o -d /usr/local/bazarr bazarr.zip

user_name="bazarr"
chown -R ${user_name} /usr/local/bazarr

pip install -r /usr/local/bazarr/requirements.txt