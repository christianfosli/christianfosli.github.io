FROM ghcr.io/getzola/zola:v0.18.0 as zola
ARG BASE_URL="https://www.christianfosli.com"

COPY . /project
COPY --from=busybox:1-uclibc /bin/sh /bin/
WORKDIR /project
RUN zola build --base-url $BASE_URL

FROM ghcr.io/static-web-server/static-web-server:2
WORKDIR /
COPY --from=zola /project/public /public
