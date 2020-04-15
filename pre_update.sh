#!/bin/sh

service bazarr stop | true
sysrc -f /etc/rc.conf bazarr_enable="NO"