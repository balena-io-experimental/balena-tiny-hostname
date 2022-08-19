# balena-tiny-hostname

Set the hostname on Balena devices. This is a fork of the official Balena package (https://github.com/balenablocks/hostname) but refactored to be smaller.

Size: 2.62mb

## Usage

To use this image, create a container in your `docker-compose.yml` file and set the `SET_HOSTNAME` environment variable as shown below:

```yaml
version: "2"

services:
  hostname:
    image: ghcr.io/maggie0002/balena-tiny-hostname
    restart: no # Required to avoid container restarting indefinitely
    labels:
      io.balena.features.supervisor-api: 1 # Required to interact with the supervisor
    environment:
      SET_HOSTNAME: balena-test-hostname
```
