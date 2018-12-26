FROM alpine:3.8


RUN mkdir -p /opt/nzbget && \
		wget --no-check-certificate -q -O /tmp/version.json http://nzbget.net/info/nzbget-version-linux.json && \
		NZBGET_VERSION=$(grep "stable-download" /tmp/version.json  | cut -d '"' -f 4) && \
		wget --no-check-certificate -q -O /tmp/nzbget.run "${NZBGET_VERSION}" && \
		sh /tmp/nzbget.run --destdir /opt/nzbget

RUN	apk update && apk add tzdata && \
	  mkdir -p /defaults && \
		mkdir -p /data && \
		mkdir -p /myfiles && \
		mkdir -p /nzb-downloads && \
		cp /opt/nzbget/nzbget.conf /defaults/nzbget.conf && \
		sed -i -e "s#\(MainDir=\).*#\1/nzb-downloads#g" \
				-e "s#\(ScriptDir=\).*#\1/data/config/scripts#g" \
				-e "s#\(DupeCheck=\).*#\1no#g" \
				-e "s#\(HealthCheck=\).*#\1delete#g" \
				-e "s#\(DeleteCleanupDisk=\).*#\1yes#g" \
				-e "s#\(DumpCore=\).*#\1no#g" \
				-e "s#\(Category1.DestDir=\).*#\1/{MainDir}/movies#g" \
				-e "s#\(ParCleanupQueue=\).*#\1yes#g" /defaults/nzbget.conf

RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh


EXPOSE 6789
VOLUME /data /nzb-downloads /myfiles


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/opt/nzbget/nzbget", "--server", "-c", "/data/config/nzbget.conf", "--option", "OutputMode=log"]

# echo [INFO] Installing RAR && \
# wget --no-check-certificate -q -O /tmp/rar.tgz http://www.rarlab.com/rar/rarlinux-x64-5.4.0.tar.gz && \
# tar --directory=/tmp -zxvf /tmp/rar.tgz && \
# cp /tmp/rar/unrar /usr/local/bin/unrar && \
