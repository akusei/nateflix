FROM mono:latest


RUN apt-get -qq update && \
    apt-get -y -qq install libcurl4-openssl-dev && \
    export VERSION=$(curl --silent "https://api.github.com/repos/Jackett/Jackett/releases/latest" | grep -ioe '"tag_name": "[^"]*' | cut -c 14-) && \
    curl -o /tmp/linux.tgz -L "https://github.com/Jackett/Jackett/releases/download/${VERSION}/Jackett.Binaries.Mono.tar.gz" && \
    tar -zxvf /tmp/linux.tgz -C /opt && \
    chmod a+x /opt/Jackett/JackettConsole.exe && \
    mkdir -p /config && \
    mkdir -p /torrents && \
    mkdir -p /etc/default && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY entrypoint /usr/local/bin/entrypoint

RUN chmod a+x /usr/local/bin/entrypoint

# RUN groupadd -g 1000 jackett && \
#     useradd -r -u 1000 -g jackett jackett && \
#     chown -R jackett:jackett /opt/Jackett && \
#     chwon -R jackett:jackett /data && \
#     chmod a+x /usr/local/bin/entrypoint

EXPOSE 80
VOLUME /config /torrents

# USER jackett

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["mono", "--debug", "/opt/Jackett/JackettConsole.exe", \
     "--NoRestart", \
     "--IgnoreSslErrors=true", \
     "--NoUpdates", \
     "--DataFolder=/config", \
     "--Port=80"]
