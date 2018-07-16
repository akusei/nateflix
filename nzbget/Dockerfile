FROM alpine:3.7

RUN mkdir -p /opt/nzbget && \
		wget --no-check-certificate -q -O /tmp/version.json http://nzbget.net/info/nzbget-version-linux.json && \
		NZBGET_VERSION=$(grep "stable-download" /tmp/version.json  | cut -d '"' -f 4) && \
		wget --no-check-certificate -q -O /tmp/nzbget.run "${NZBGET_VERSION}" && \
		sh /tmp/nzbget.run --destdir /opt/nzbget

RUN	mkdir -p /defaults && \
		mkdir -p /data && \
		mkdir -p /media && \
		mkdir -p /software && \
		cp /opt/nzbget/nzbget.conf /defaults/nzbget.conf && \
		sed -i -e "s#\(MainDir=\).*#\1/data/downloads#g" \
				-e "s#\(ScriptDir=\).*#\1/data/config/scripts#g" \
				-e "s#\(DupeCheck=\).*#\1no#g" \
				-e "s#\(HealthCheck=\).*#\1delete#g" \
				-e "s#\(DeleteCleanupDisk=\).*#\1yes#g" \
				-e "s#\(DumpCore=\).*#\1no#g" \
				-e "s#\(Category1.DestDir=\).*#\1/{MainDir}/movies#g" \
				-e "s#\(ParCleanupQueue=\).*#\1yes#g" /defaults/nzbget.conf && \
		echo "Category4.DestDir=/software" >> /defaults/nzbget.conf

RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 6789
VOLUME /data /media /software

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# echo [INFO] Installing RAR && \
# wget --no-check-certificate -q -O /tmp/rar.tgz http://www.rarlab.com/rar/rarlinux-x64-5.4.0.tar.gz && \
# tar --directory=/tmp -zxvf /tmp/rar.tgz && \
# cp /tmp/rar/unrar /usr/local/bin/unrar && \
