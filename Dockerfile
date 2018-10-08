FROM alpine:latest
MAINTAINER leafney "babycoolzx@126.com"

ARG MYSQL_DATA_VOLUME
ENV MYSQL_DATA_VOLUME="${MYSQL_DATA_VOLUME:-false}"

RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql && \
	mkdir /scripts && \
	rm -rf /var/cache/apk/*

#VOLUME ["/var/lib/mysql"]
VOLUME [$MYSQL_DATA_VOLUME]

COPY ./startup.sh /scripts/startup.sh
RUN chmod +x /scripts/startup.sh

EXPOSE 3306

ENTRYPOINT ["/scripts/startup.sh"]
