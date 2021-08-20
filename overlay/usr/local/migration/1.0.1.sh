#!/bin/sh

echo "Running migration for 0.3.0"

pkg install unzip # quickfix before index portback

echo "Fetch ZIP"
fetch https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip

echo "Unzip bazarr archive"
unzip -o -d /usr/local/bazarr bazarr.zip

user_name="bazarr"
chown -R ${user_name} /usr/local/bazarr

pip install -r /usr/local/bazarr/requirements.txt