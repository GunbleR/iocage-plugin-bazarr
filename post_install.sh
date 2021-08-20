#!/bin/sh

mkdir -p /usr/local/etc/rc.d

# quickfix before index portback
pkg install -y unzip
pkg delete -y git-lite

user_name="bazarr"

echo "Fetch ZIP"
fetch https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip

echo "Unzip bazarr archive"
unzip -d /usr/local/bazarr bazarr.zip

echo "Installing bazarr requirements"
pip install -r /usr/local/bazarr/requirements.txt

echo "Creating new user with name: ${user_name}"
pw useradd -n ${user_name} -c "Bazarr" -s /sbin/nologin -w no
chown -R ${user_name} /usr/local/bazarr

echo "Start bazarr service"
chmod +x /usr/local/etc/rc.d/bazarr
sysrc -f /etc/rc.conf bazarr_enable="YES"
service bazarr start

echo "Post install completed!"