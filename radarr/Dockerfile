FROM mono:latest

ARG PUID=1000
ARG PGID=1000
ENV RELEASE_URL=https://api.github.com/repos/Radarr/Radarr/releases

RUN groupadd -o -g ${PGID} radarr && \
    useradd -r -o -u ${PUID} -g radarr radarr

RUN apt-get update && \
		apt-get -qq -y install curl mediainfo dumb-init && \
		export URL=$(curl -s ${RELEASE_URL} | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d '"' -f 4 ) && \
		curl -o /tmp/radarr.tar.gz -L -O "${URL}" && \
		tar -xvzf /tmp/radarr.tar.gz -C /opt && \
		chown -R radarr:radarr /opt/Radarr && \
		apt-get clean && \
		rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 7878
VOLUME /config /data /nzb-downloads /torrent-downloads

USER radarr

ENTRYPOINT ["/usr/bin/dumb-init", "--rewrite", "15:2", "--"]
CMD ["mono", "--debug", "/opt/Radarr/Radarr.exe", \
     "-terminateexisting", \
		 "-nobrowser", \
		 "-data=/config"]
