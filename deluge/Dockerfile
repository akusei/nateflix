FROM python:3.7.1-alpine3.8


# ADD REPO AND UPDATE
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
		echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
		apk update

# INSTALL DELUGE
RUN apk add tzdata geoip py-pip boost-system@edge boost-python@edge \
				    libssl1.1@edge deluge@testing && \
		pip install --upgrade pip && \
		pip install --upgrade setuptools && \
		pip2 install MarkupSafe incremental constantly packaging automat service_identity && \
		/etc/periodic/monthly/geoip && \
		mkdir /default && \
		mkdir /data && \
		mkdir /data-web && \
		mkdir /torrent-downloads && \
		mkdir /myfiles && \
		mkdir /openvpn

# INSTALL SUPERVISOR
RUN apk add supervisor
COPY etc/ /etc/
COPY config/ /default/

# INSTALL OPENVPN
RUN apk add openvpn ip6tables ufw@testing && \
		cd /etc/openvpn && \
		wget -O openvpn.zip "https://www.privateinternetaccess.com/openvpn/openvpn-ip.zip" && \
		unzip openvpn.zip && \
		rm -rf ./openvpn.zip && \
		sed -i -e 's/^IPV6=yes$/IPV6=no/g' /etc/default/ufw

# CLEANUP
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod a+x /usr/local/bin/entrypoint


EXPOSE 58846/tcp
EXPOSE 8112/tcp
EXPOSE 58946/tcp
EXPOSE 58946/udp

VOLUME /data /data-web /openvpn /torrent-downloads /myfiles


ENTRYPOINT ["entrypoint"]
CMD ["supervisord"]
