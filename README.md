# A Node-Red Slim Container with Alpine

Current size is __374MB__ with basic Node-Red UI.

## Multi-Stage Docker

Base and production ready images on `alpine:3.13`, Build Stage through: `nodered/node-red:2.2.2-minimal`

## Usage

### Building Image

```bash
docker build -t node-red-slim:latest .
```
### Running Image

```bash
docker run -d --name=my-slim-nodered \
    -e NODERED_AUTH_ADMIN_USERNAME=admin \
    -e NODERED_AUTH_ADMIN_PASSWORD='$2a$08$zZWtXTja0fB1pzD4sHCMyOCMYz2Z6dNbM6tl8sJogENOMcxWV9DN.' \
    -p 1880:1880 \
    node-red-slim:latest
```
here the encrypted password is `password` as an example

### Build and Run using `docker-compose`

```bash
docker-compose build nodered-slim && docker-compose up
```

### Mentions
Thank you to Shantanoo Desai <shantanoo.desai@gmail.com> for providing a fork as the original template.