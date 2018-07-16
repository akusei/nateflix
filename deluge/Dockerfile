FROM ubuntu:bionic


RUN apt-get update && \
		apt-get install -y software-properties-common && \
		apt-key adv --fetch-keys "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC5E6A5ED249AD24C" && \
		add-apt-repository -y ppa:deluge-team/ppa && \
		apt-get update && \
		apt-get install -y python && \
		apt-get install -y deluged deluge-web supervisor && \
		mkdir /data && \
		mkdir /data-web && \
		apt-get clean && \
		rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY etc/ /etc/


EXPOSE 58846/tcp
EXPOSE 8112/tcp

VOLUME /data /data-web


ENTRYPOINT ["supervisord"]
