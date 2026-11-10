# docker_mpd
FROM alpine:edge
ARG PKG="amule"
ARG VER="2.3.3-r13"
ARG USR="https://github.com/J-Siu"
LABEL version=${VER}
LABEL maintainers="[John Sing Dao Siu](${USR})"
LABEL name=${PKG}
LABEL usage="${USR}/docker_${PKG}/blob/master/README.md"
LABEL description="Docker - amule"

COPY docker-compose.yml env start.sh /
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
&& apk --no-cache add tzdata amule=${VER} git \
&& mkdir -p /amule \
# Include AmuleWebUI-Reloaded
&& cd /usr/share/amule/webserver \
&& git clone https://github.com/MatteoRagni/AmuleWebUI-Reloaded \
&& rm -rf AmuleWebUI-Reloaded/.git AmuleWebUI-Reloaded/doc-images \
&& apk del git \
&& chmod +x /start.sh

CMD ["/start.sh"]
