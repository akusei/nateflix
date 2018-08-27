FROM mono:latest


RUN apt-get update && \
		mkdir -p /data /myfiles /nzb-downloads /torrent-downloads && \
		apt-get -qq -y install sqlite3 curl mediainfo && \
		curl -o /tmp/sonarr.tar.gz -L -O "http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz" && \
		tar -xvzf /tmp/sonarr.tar.gz -C /opt && \
		apt-get clean && \
		rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


EXPOSE 8989
VOLUME /data /myfiles /nzb-downloads /torrent-downloads


ENTRYPOINT ["mono", "--debug", "/opt/NzbDrone/NzbDrone.exe", "-terminateexisting", "-nobrowser", "-data=/data"]
