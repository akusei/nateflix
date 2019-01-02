FROM microsoft/dotnet:2.2.0-aspnetcore-runtime-stretch-slim
# next release of OMBI will support alpine

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8


RUN apt-get update && \
		apt-get install -y curl libicu-dev libunwind8 libcurl4-openssl-dev && \
		export VERSION=$(curl --silent "https://api.github.com/repos/tidusjar/Ombi/releases/latest" | grep -ioe '"tag_name": "[^"]*' | cut -c 14-) && \
		curl -o /tmp/linux.tgz -L "https://github.com/tidusjar/Ombi/releases/download/${VERSION}/linux.tar.gz" && \
		mkdir -p /opt/Ombi && \
		tar -zxvf /tmp/linux.tgz -C /opt/Ombi && \
		chmod a+x /opt/Ombi/Ombi && \
		mkdir -p /config && \
		rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


EXPOSE 5000
VOLUME /config

WORKDIR /opt/Ombi


ENTRYPOINT ["/opt/Ombi/Ombi", "--storage", "/data"]
