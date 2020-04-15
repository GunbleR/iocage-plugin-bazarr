#!/bin/sh

service bazarr stop
sysrc -f /etc/rc.conf bazarr_enable="NO"