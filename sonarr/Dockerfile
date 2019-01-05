FROM mono:latest

ARG PUID=1000
ARG PGID=1000

RUN groupadd -o -g ${PGID} sonarr && \
    useradd -r -o -u ${PUID} -g sonarr sonarr

RUN apt-get update && \
		apt-get -qq -y install sqlite3 curl mediainfo dumb-init && \
		curl -o /tmp/sonarr.tar.gz -L -O "http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz" && \
		tar -xvzf /tmp/sonarr.tar.gz -C /opt && \
		chown -R sonarr:sonarr /opt/NzbDrone && \
		apt-get clean && \
		rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 8989
VOLUME /config /data /nzb-downloads /torrent-downloads

USER sonarr

ENTRYPOINT ["/usr/bin/dumb-init", "--rewrite", "15:2", "--"]
CMD ["mono", "--debug", "/opt/NzbDrone/NzbDrone.exe", \
     "-terminateexisting", \
		 "-nobrowser", \
		 "-data=/config"]
