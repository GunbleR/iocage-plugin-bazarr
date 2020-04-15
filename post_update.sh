#!/bin/sh

service bazarr stop

./usr/local/migration//0.0.2.sh
./usr/local/migration//0.0.3.sh

service bazarr start