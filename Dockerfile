FROM alpine:3.13 AS base

MAINTAINER "Shantanoo <Shan> Desai <shantanoo.desai@gmail.com>"

USER root
RUN apk add nodejs npm python3 udev make g++ linux-headers

FROM nodered/node-red:2.2.2-minimal AS build

COPY package.json .

RUN npm install --unsafe-perm --no-update-notifier --no-audit --only=production

FROM base as prod

RUN mkdir -p /usr/src/node-red && mkdir /data

WORKDIR /usr/src/node-red
COPY settings.js /data/settings.js
COPY --from=build /data/ /data/
COPY --from=build /usr/src/node-red  /usr/src/node-red

CMD ["npm", "start"]