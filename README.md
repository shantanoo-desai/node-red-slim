# A Node-Red Slim Container with Alpine

Current size is __374MB__ with basic Node-Red UI.

## Multi-Stage Docker

Base and production ready images on `alpine:3.18`, Build Stage through: `nodered/node-red:3.1.0-18-minimal`

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

### Raspberry Pi
There is a known issue when running on raspberry pi which requires the following when launching the container. The `--security-opt seccomp=unconfined` be added to your run command or to your compose file:

```
    #required on raspberry pi - alpine slim >3.13 fails to ping
    security-opt:
      - seccomp=unconfined
```

### Build and Run using `docker-compose`

```bash
docker-compose build nodered-slim && docker-compose up
```

### Mentions
Thank you to Shantanoo Desai <shantanoo.desai@gmail.com> for providing a fork as the original template.