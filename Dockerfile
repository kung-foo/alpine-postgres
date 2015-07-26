FROM gliderlabs/alpine:3.2

MAINTAINER docker@jonathan.camp

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update
RUN apk add curl "postgresql@edge>9.4"

RUN curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

COPY entrypoint.sh /opt/

ENTRYPOINT ["/opt/entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
