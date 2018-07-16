FROM mono:5.12.0.226


RUN apt-get update && \
	mkdir -p /data && \
	mkdir -p /media && \
	apt-get -qq -y install coreutils curl mediainfo && \
	curl -o /tmp/radarr.tar.gz -L -O $(curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d '"' -f 4 ) && \
	tar -xvzf /tmp/radarr.tar.gz -C /opt && \
  apt-get clean && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


EXPOSE 7878
VOLUME /data /media

ENTRYPOINT ["mono", "--debug", "/opt/Radarr/Radarr.exe", "-terminateexisting", "-nobrowser", "-data=/data"]
