FROM alpine:3.8

ARG PUID=1000
ARG PGID=1000

RUN mkdir -p /opt/nzbget && \
		wget --no-check-certificate -q -O /tmp/version.json http://nzbget.net/info/nzbget-version-linux.json && \
		NZBGET_VERSION=$(grep "stable-download" /tmp/version.json  | cut -d '"' -f 4) && \
		wget --no-check-certificate -q -O /tmp/nzbget.run "${NZBGET_VERSION}" && \
		sh /tmp/nzbget.run --destdir /opt/nzbget && \
		chown -R ${PUID}:${PGID} /opt/nzbget

RUN	apk add --no-cache tzdata && \
		sed -i -e "s#\(MainDir=\).*#\1/nzb-downloads#g" \
				-e "s#\(ScriptDir=\).*#\1/config/scripts#g" \
				-e "s#\(LockFile=\).*#\1/tmp/nzbget.lock#g" \
				-e "s#\(LogFile=\).*#\1/config/nzbget.log#g" \
				-e "s#\(DupeCheck=\).*#\1no#g" \
				-e "s#\(HealthCheck=\).*#\1delete#g" \
				-e "s#\(NzbCleanupDisk=\).*#\1yes#g" \
				-e "s#\(CrashDump=\).*#\1no#g" \
				-e "s#\(ControlUsername=\).*#\1#g" \
				-e "s#\(ControlPassword=\).*#\1#g" \
				-e "s#\(ParCleanupQueue=\).*#\1yes#g" /opt/nzbget/nzbget.conf

COPY entrypoint /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint

EXPOSE 6789
VOLUME /config /nzb-downloads /data

USER ${PUID}:${PGID}

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["/opt/nzbget/nzbget", "--server", "-c", "/config/nzbget.conf", "-o", "OutputMode=loggable"]

# echo [INFO] Installing RAR && \
# wget --no-check-certificate -q -O /tmp/rar.tgz http://www.rarlab.com/rar/rarlinux-x64-5.4.0.tar.gz && \
# tar --directory=/tmp -zxvf /tmp/rar.tgz && \
# cp /tmp/rar/unrar /usr/local/bin/unrar && \
