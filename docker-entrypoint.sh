#!/bin/bash
set -e

# Fix permission for /data volume di Railway
# Volume di-mount setelah build, jadi permission-nya default (root)
# Kita fix as root sebelum switch ke node user

if [ "$(id -u)" = "0" ]; then
  echo "Fixing /data directory permissions for node user..."
  mkdir -p /data
  chown -R node:node /data
  chmod -R 755 /data
fi

# Exec original app sebagai node user
exec node dev/run-standalone.mjs

