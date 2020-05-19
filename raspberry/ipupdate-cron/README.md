### TODOs
- Make sure that log file does not grow to large

# Install
## create secret
- kubectl create secret generic ipupdate-config -n fuebiapp --from-literal=DYN_SECRET=<YOURSECRET>

# Build
## Docker
- docker build -t blacktr/ipcronejob -f Dockerfile .
- docker push blacktr/ipcronejob

# Debug
## Build cronejob
- docker run -it --rm blacktr/ipcronejob
- docker exec -it 63d7da431cf5 /bin/bash

##  kubernetes run shell
- kubectl exec -it ipupdate-75f459f4b-c4vnl -n fuebiapp -- /bin/bash

## Cron Log
- cat /var/log/cron.log  
