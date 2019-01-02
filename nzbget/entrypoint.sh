#!/bin/sh

if [ ! -d /config/config ] || [ ! -d /config/runtime ]; then
  echo "[INFO] Creating directory structure"
  mkdir -p /config/config/scripts
  mkdir -p /config/runtime
fi

if [ ! -f /config/config/nzbget.conf ]; then
  echo "[INFO] Copying config into /config/nzbget.conf"
  cp /defaults/nzbget.conf /config/config/nzbget.conf
fi

if [ -f /config/runtime/nzbget.lock ]; then
  rm -rf /config/runtime/nzbget.lock
fi

exec "$@"
