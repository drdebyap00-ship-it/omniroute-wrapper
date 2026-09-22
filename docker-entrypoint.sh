#!/bin/bash
set -e

# Fix permission for /data volume di Railway
# Volume di-mount setelah build dengan ownership root, kita chmod jadi world-writable
# Ini temporary fix sampai image asli di-update

if [ "$(id -u)" = "0" ]; then
  echo "Fixing /data directory permissions..."
  mkdir -p /data
  chmod 777 /data
  echo "/data permissions fixed (mode 777)"
fi

# Run app
exec node dev/run-standalone.mjs

