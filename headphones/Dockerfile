FROM python:2.7.15-alpine3.7


RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
		apk update && \
		apk add --upgrade apk-tools && \
		apk add --no-cache --virtual .git git && \
		apk add --no-cache shntool ffmpeg flac && \
		mkdir /data && \
		mkdir /downloads && \
		mkdir /defaults && \
		mkdir /music && \
		git clone --depth 1 https://github.com/rembo10/headphones.git /opt/headphones

RUN echo [General] > /defaults/config.ini && \
		echo cue_split_shntool_path = /usr/bin/shntool >> /defaults/config.ini && \
		echo download_dir = /downloads >> /defaults/config.ini && \
		echo launch_browser = 0 >> /defaults/config.ini && \
		echo cleanup_files = 1 >> /defaults/config.ini && \
		echo correct_metadata = 1 >> /defaults/config.ini && \
		echo http_host = 0.0.0.0 >> /defaults/config.ini && \
		echo ignore_clean_releases = 1 >> /defaults/config.ini && \
		echo move_files = 1 >> /defaults/config.ini && \
		echo preferred_quality = 1 >> /defaults/config.ini && \
		echo rename_files = 1 >> /defaults/config.ini && \
		echo replace_existing_folders = 1 >> /defaults/config.ini && \
		echo usenet_retention = 3000 >> /defaults/config.ini && \
		echo wait_until_release_date = 1 >> /defaults/config.ini && \
		echo music_dir = /music >> /defaults/config.ini && \
		echo destination_dir = /music >> /defaults/config.ini && \
		echo git_path = https://github.com/rembo10/headphones.git >> /defaults/config.ini

RUN echo [Songkick] >> /defaults/config.ini && \
		echo songkick_enabled = 0 >> /defaults/config.ini

RUN apk del .git && \
		rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /etc/apk/repositories

COPY entrypoint.sh /usr/local/bin/entrypoint.sh


EXPOSE 8181
VOLUME /data /downloads /music

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
