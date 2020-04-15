#!/bin/sh

./usr/local/migration/0.1.0.sh
./usr/local/migration/0.2.0.sh

#sysrc -f /etc/rc.conf bazarr_enable="YES"
#service bazarr start