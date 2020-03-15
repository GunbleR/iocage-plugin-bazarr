#!/bin/sh

mkdir -p /usr/local/etc/rc.d

version="0.8.4.2"
user_name="bazarr"

echo "Downloading bazarr version: ${version}"
fetch "https://github.com/morpheus65535/bazarr/archive/v${version}.tar.gz"
tar xfz "v${version}.tar.gz" -C /usr/local/
mv "/usr/local/bazarr-${version}" /usr/local/bazarr

echo "Installing bazarr requirements"
pip install -r /usr/local/bazarr/requirements.txt

echo "Creating new user with name: {user_name}"
pw useradd -n ${user_name} -c "Bazarr" -s /sbin/nologin -w no
chown -R ${user_name}  /usr/local/bazarr

echo "Start bazarr service"
chmod +x /usr/local/etc/rc.d/bazarr
sysrc -f /etc/rc.conf bazarr_enable="YES"
service bazarr start

echo "Post install completed!"