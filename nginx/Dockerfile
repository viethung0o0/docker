FROM nginx:alpine

ADD nginx.conf /etc/nginx/

ARG PHP_UPSTREAM=php-fpm

# fix a problem--#397, change application source from dl-cdn.alpinelinux.org to aliyun source.
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data \
    && rm /etc/nginx/conf.d/default.conf \
    && echo "upstream php-upstream { server ${PHP_UPSTREAM}:9000; }" > /etc/nginx/conf.d/upstream.conf

# install openssl
RUN apk add --no-cache openssl

# create a folder for the keys
RUN mkdir /etc/nginx/ssl 2> /dev/null

# generate the keys for your local domain
RUN openssl genrsa -out "/etc/nginx/ssl/local.key" 2048 \
    && openssl req -new -key "/etc/nginx/ssl/local.key" -out "/etc/nginx/ssl/local.csr" -subj "/CN=local/O=local/C=UK" \
    && openssl x509 -req -days 365 -in "/etc/nginx/ssl/local.csr" -signkey "/etc/nginx/ssl/local.key" -out "/etc/nginx/ssl/local.crt"

CMD ["nginx"]

EXPOSE 80 443
