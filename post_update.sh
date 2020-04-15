#!/bin/sh

./usr/local/migration//0.0.2.sh
./usr/local/migration//0.0.3.sh

echo "Restart bazarr"
service bazarr stop
service bazarr start