#!/bin/sh

mkdir -p /usr/local/etc/rc.d

version="0.8.4.2"
echo "Downloading bazarr verion"
fetch "https://github.com/morpheus65535/bazarr/archive/v${version}.tar.gz"
tar xfz "v${version}.tar.gz" -C /usr/local/
mv "/usr/local/bazarr-${version}" /usr/local/bazarr

pip install -r /usr/local/bazarr/requirements.txt --user

# Create bazarr user
pw useradd -n bazarr -c "Bazarr" -s /sbin/nologin -w no
chown -R bazarr /usr/local/bazarr

# Enable bazarr service
chmod +x /usr/local/etc/rc.d/bazarr
sysrc -f /etc/rc.conf bazarr_enable="YES"

# Start service
service bazarr start