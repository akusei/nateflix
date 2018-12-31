FROM mono:latest


RUN apt-get -qq update && \
    apt-get -y -qq install libcurl4-openssl-dev && \
    export VERSION=$(curl --silent "https://api.github.com/repos/Jackett/Jackett/releases/latest" | grep -ioe '"tag_name": "[^"]*' | cut -c 14-) && \
    curl -o /tmp/linux.tgz -L "https://github.com/Jackett/Jackett/releases/download/${VERSION}/Jackett.Binaries.Mono.tar.gz" && \
    tar -zxvf /tmp/linux.tgz -C /opt && \
    chmod a+x /opt/Jackett/JackettConsole.exe && \
    mkdir -p /data && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


EXPOSE 9117
VOLUME /data


ENTRYPOINT ["mono", "--debug", "/opt/Jackett/JackettConsole.exe", "--IgnoreSslErrors=true", "--NoUpdates", "--DataFolder=/data"]
