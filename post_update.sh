#!/bin/sh

./usr/local/migration/0.0.2.sh
./usr/local/migration/0.0.3.sh

sysrc -f /etc/rc.conf bazarr_enable="YES"
service bazarr start