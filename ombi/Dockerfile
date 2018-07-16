FROM microsoft/dotnet:2.1.2-aspnetcore-runtime


RUN apt-get update -qq && \
	apt-get install -qq -y gnupg wget && \
	echo "deb http://repo.ombi.turd.me/stable/ jessie main" > /etc/apt/sources.list.d/ombi.list && \
	wget -qO - https://repo.ombi.turd.me/pubkey.txt | apt-key add - && \
	apt-get update -qq && \
	mkdir /data && \
	apt-get install -qq -y ombi && \
  apt-get clean && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


EXPOSE 5000
VOLUME /data

WORKDIR /opt/Ombi

ENTRYPOINT ["/opt/Ombi/Ombi", "--storage", "/data"]
