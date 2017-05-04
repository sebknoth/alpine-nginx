FROM shito/alpine-base
MAINTAINER Sebastian Faujour <sf@bytepark.de>

# Add NGINX-Webserver with NAXSI
RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
    nginx \
    shadow

COPY /rootfs /

# Small fixes
RUN rm -fr /var/cache/apk/*
RUN usermod -u 1000 nginx

# Expose Ports
EXPOSE 443
EXPOSE 80