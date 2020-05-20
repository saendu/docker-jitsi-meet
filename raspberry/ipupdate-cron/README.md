### TODOs
- Make sure that log file does not grow to large

# Install
## create secret
- kubectl create secret generic ipupdate-config -n fuebiapp --from-literal=DYN_SECRET=<YOURSECRET>

# Build
## Docker
### On OSX (with Docker Desktop Edge)
- docker buildx build --platform linux/arm64 -t blacktr/ipupdate-cron --push .

### On RPi4
- docker build -t blacktr/ipupdate-cron -f Dockerfile .
- docker push blacktr/ipupdate-cron

# Debug
## Build cronejob
- docker run -it --rm blacktr/ipupdate-cron
- docker exec -it 63d7da431cf5 /bin/bash

##  kubernetes run shell
- kubectl exec -it ipupdate-cron-75f459f4b-c4vnl -n fuebiapp -- /bin/bash

## Cron Log
- cat /var/log/cron.log  
