FROM mono:latest


ENV RELEASE_URL=https://api.github.com/repos/Radarr/Radarr/releases


RUN apt-get update && \
		mkdir -p /data /myfiles /nzb-downloads /torrent-downloads && \
		apt-get -qq -y install curl mediainfo && \
		export URL=$(curl -s ${RELEASE_URL} | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d '"' -f 4 ) && \
		curl -o /tmp/radarr.tar.gz -L -O "${URL}" && \
		tar -xvzf /tmp/radarr.tar.gz -C /opt && \
		apt-get clean && \
		rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


EXPOSE 7878
VOLUME /data /myfiles /nzb-downloads /torrent-downloads


ENTRYPOINT ["mono", "--debug", "/opt/Radarr/Radarr.exe", "-terminateexisting", "-nobrowser", "-data=/data"]
