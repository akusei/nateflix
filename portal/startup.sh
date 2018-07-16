#!/bin/sh

cd /opt/portal
exec gunicorn -w 4 --bind 0.0.0.0:8000 src.wsgi
