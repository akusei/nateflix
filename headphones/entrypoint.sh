#!/bin/sh

if [ ! -f /data/config.ini ]; then
  cp /defaults/config.ini /data/config.ini
fi

exec python /opt/headphones/Headphones.py --datadir=/data --nolaunch
