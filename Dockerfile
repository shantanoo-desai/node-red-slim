FROM alpine:3.13 AS base

LABEL AUTHOR="Shantanoo <Shan> Desai <shantanoo.desai@gmail.com>"

RUN apk add --no-cache \
            nodejs \
            npm && \
    mkdir -p /usr/src/node-red /data && \
    adduser -h /usr/src/node-red -D -H node-red -u 1000 && \
    chown -R node-red:node-red /data 

FROM nodered/node-red:2.2.2-minimal AS build

COPY package.json .

RUN npm install --unsafe-perm --no-update-notifier --no-audit --only=production

FROM base as prod

COPY --from=build --chown=node-red:node-red /data/ /data/

WORKDIR /usr/src/node-red
COPY settings.js /data/settings.js
COPY flows.json  /data/flows.json

COPY --from=build --chown=node-red:node-red /usr/src/node-red/  /usr/src/node-red/
USER node-red

CMD ["npm", "start"]