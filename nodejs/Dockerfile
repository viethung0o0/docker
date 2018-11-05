ARG NODE_VERSION=latest
FROM node:${NODE_VERSION}-alpine

RUN apk --no-cache add tzdata ca-certificates && npm install pm2@latest -g

WORKDIR /var/www/neolab/chatbot-fb

EXPOSE 8081

CMD ["pm2-runtime", "server.js", "--watch", "--ignore-watch=\"store/** frontend/** public/**\""]