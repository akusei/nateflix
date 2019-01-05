FROM python:3.7.1-alpine3.8

ENV PUID=1000
ENV PGID=1000


# ADD REPO AND UPDATE
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
		echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
		apk update

# INSTALL DELUGE
RUN apk add --no-cache tzdata py-pip boost-system@edge boost-python@edge \
				    su-exec libssl1.1@edge py-constantly@edge py-incremental@edge \
						deluge@testing supervisor && \
		pip install --upgrade pip && \
		pip install --upgrade setuptools && \
		pip2 install MarkupSafe incremental constantly packaging automat service_identity && \
		mkdir /default

COPY etc/ /etc/
COPY config/ /default/

# INSTALL OPENVPN
RUN apk add --no-cache openvpn ip6tables ufw@testing && \
		cd /etc/openvpn && \
		wget -O openvpn.zip "https://www.privateinternetaccess.com/openvpn/openvpn-ip.zip" && \
		unzip openvpn.zip && \
		rm -rf ./openvpn.zip && \
		sed -i -e 's/^IPV6=yes$/IPV6=no/g' /etc/default/ufw

# CLEANUP
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY entrypoint /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint


EXPOSE 58846/tcp
EXPOSE 8112/tcp
EXPOSE 58946/tcp
EXPOSE 58946/udp

VOLUME /deluge-config /deluge-web-config /openvpn /torrent-downloads /data


ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
