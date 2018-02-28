FROM zuohuadong/caddy:alpine

ARG plugins="cors"

## ARG plugins="cors cgi cloudflare azure linode"

RUN caddyplug install ${plugins}


EXPOSE 80 443 2015

##Ex: WORKDIR /var/www/calling/calling-twilio/public
WORKDIR /var/www/public

CMD ["/usr/bin/caddy", "-conf", "/etc/Caddyfile"]
