### build
podman build --tag ubuntu:spgl-appsec .

### run
podman run -p 5000:5000 -it ubuntu:spgl-appsec bash

### remove builds
podman rmi -a -f

### Notes
- app directory is first copied from local machine into container scripts directory (Dockerfile), 
then copied to container app directory (scripts/finish.sh) 