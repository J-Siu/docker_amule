# docker_mpd
FROM alpine:edge

LABEL version="2.3.3-r13"
LABEL maintainers="[John Sing Dao Siu](https://github.com/J-Siu)"
LABEL name="amule"
LABEL usage="https://github.com/J-Siu/docker_amule/blob/master/README.md"
LABEL description="Docker - amule"

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
&& apk --no-cache add tzdata amule=2.3.3-r13 git \
&& mkdir -p /amule

# Include AmuleWebUI-Reloaded
RUN cd /usr/share/amule/webserver \
&& git clone https://github.com/MatteoRagni/AmuleWebUI-Reloaded \
&& rm -rf AmuleWebUI-Reloaded/.git AmuleWebUI-Reloaded/doc-images \
&& apk del git

COPY docker-compose.yml env start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]