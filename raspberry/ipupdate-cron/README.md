# Install
## create secret
kubectl create secret generic ipupdate-config -n fuebiapp --from-literal=DYN_SECRET=<YOURSECRET>

# Debug
## Build cronejob
docker build -t blacktr/ipcronejob -f Dockerfile .
docker run -it --rm blacktr/ipcronejob
docker exec -it 63d7da431cf5 /bin/bash
