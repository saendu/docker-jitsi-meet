az login
az account set --subscription fc57a1bc-af37-4cbd-a0c1-d7946c8966ab

# *INFO* REINSTALL (uninstall/install) if meet.fuebiapp.com not responding
helm install nginx-ingress stable/nginx-ingress \
--namespace jitsi \
--set controller.replicaCount=2 \
--set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
--set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux \
--set controller.service.loadBalancerIP="51.136.125.32" \
--set controller.service.annotations."service\.beta\.kubernetes\.io/azure-dns-label-name"="meetapp"

az network public-ip list --resource-group MC_k8_k8-cluster_westeurope

az network dns record-set a add-record \
--resource-group k8 \
--zone-name fuebiapp.com \
--record-set-name '*' \
--ipv4-address 51.136.125.32

kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.13/deploy/manifests/00-crds.yaml

# maybe namespace is not best
kubectl label namespace jitsi cert-manager.io/disable-validation=true
helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install \
  cert-manager \
  --namespace jitsi \
  --version v0.13.0 \
  jetstack/cert-manager

# OR THIS ONE if error on above
helm template cert-manager jetstack/cert-manager --version v0.13.0 --namespace jitsi | kubectl apply -f -

# start dashboard
az aks browse --resource-group k8 --name k8-cluster

# test yaml files
kubectl apply --dry-run=server -f .
  