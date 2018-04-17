FROM node:latest

WORKDIR /app

ADD package.json /app
ADD echo.json /app

#RUN npm install pm2 -g

RUN npm install

EXPOSE 6001

#CMD pm2 start --no-daemon echo.json -i max
CMD node_modules/.bin/pm2 --no-daemon start echo.json -i max
#CMD /app/node_modules/.bin/laravel-echo-server start