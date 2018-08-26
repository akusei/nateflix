FROM mono:latest


RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
	echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list && \
	apt-get update && \
	mkdir -p /data && \
	mkdir -p /media && \
	apt-get -qq -y install nzbdrone coreutils && \
  apt-get clean && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


EXPOSE 8989
VOLUME /data /media

ENTRYPOINT ["mono", "--debug", "/opt/NzbDrone/NzbDrone.exe", "-terminateexisting", "-nobrowser", "-data=/data"]
