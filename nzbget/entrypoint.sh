#!/bin/sh

if [ ! -d /data/config ] || [ ! -d /data/runtime ]; then
  echo "[INFO] Creating directory structure"
  mkdir -p /data/config/scripts
  mkdir -p /data/runtime
fi

if [ ! -f /data/config/nzbget.conf ]; then
  echo "[INFO] Copying config into /data/nzbget.conf"
  cp /defaults/nzbget.conf /data/config/nzbget.conf
fi

if [ -f /data/runtime/nzbget.lock ]; then
  rm -rf /data/runtime/nzbget.lock
fi

exec /opt/nzbget/nzbget --server -c /data/config/nzbget.conf --option OutputMode=log
