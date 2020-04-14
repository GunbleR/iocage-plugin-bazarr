#!/bin/sh

echo "Running migration for 0.0.2"

ls -l migration
git log
./migration/0.0.2_2.sh