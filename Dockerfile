FROM alpine:3.4

ENV REFRESHED_AT=2016-09-09 \
    TZ="Europe/Oslo" \
    TERM="xterm-256color" \
    LANG="en_US.UTF-8" \
    PYTHONIOENCODING="utf-8" \
    S6_OVERLAY_VERSION=v1.18.1.5

COPY root /

RUN apk update && apk upgrade && apk add curl && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xfz - -C / && \
    echo done

ENTRYPOINT ["/init"]
CMD []

HEALTHCHECK CMD /usr/bin/docker-healthcheck
