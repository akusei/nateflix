FROM python:3.6.5-alpine3.7

RUN pip install pytz django gunicorn && \
    mkdir -p /opt/portal

COPY startup.sh /usr/local/bin/startup.sh

ENTRYPOINT ["/usr/local/bin/startup.sh"]
