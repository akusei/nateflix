FROM mono:latest

ARG PUID=1000
ARG PGID=1000
ENV RELEASE_URL=https://api.github.com/repos/lidarr/Lidarr/releases

RUN groupadd -o -g ${PGID} lidarr && \
    useradd -r -o -u ${PUID} -g lidarr lidarr

RUN apt-get update && \
		apt-get install -y mediainfo dumb-init && \
		export URL=$(curl -s ${RELEASE_URL} | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d '"' -f 4 ) && \
		curl -o /opt/lidarr.tgz -L "${URL}" && \
		tar -zxvf /opt/lidarr.tgz -C /opt && \
		chown -R lidarr:lidarr /opt/Lidarr

RUN rm -rf /opt/lidarr.tgz && \
		rm -rf /var/lib/apt/lists/*

EXPOSE 8686/tcp
VOLUME /config /data /torrent-downloads /nzb-downloads

USER lidarr

ENTRYPOINT ["/usr/bin/dumb-init", "--rewrite", "15:2", "--"]
CMD ["mono", "--debug", "/opt/Lidarr/Lidarr.exe", "/nobrowser", "/data=/config"]
