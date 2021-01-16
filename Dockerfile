FROM nginx:stable-alpine

COPY default.conf /etc/nginx/conf.d/
COPY start.sh /

RUN apk add openssl=1.1.1i-r0 --no-cache && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/nginx/ssl && \
    mkdir -p /srv/data && \
    chmod +x ./start.sh

ENTRYPOINT [ "/start.sh" ]

# Use `hadolint` to check this file:
#    $ docker run --rm -i hadolint/hadolint < Dockerfile
