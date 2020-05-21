# Create simple Letsencrypt cert
## General
Make sure that DNS points to kubernetes cluster (A-record or CNAME)

## Kubernetes deployment
kubectl apply -f deployment.yaml 
kubectl apply -f service.yaml 
kubectl apply -f notls.yaml 

## Create root & subdomain cert inside pod
kubectl exec -it nginx-deployment-7d4f6766d4-jz225 -- /bin/bash
certbot certonly --webroot --webroot-path /usr/share/nginx/html -d meet.afterworkbeer.com -d afterworkbeer.com

## create tls secret to use cert
kubectl cp default/nginx-deployment-7d4f6766d4-jz225:/etc/letsencrypt/archive/meet.afterworkbeer.com ~/cert/afterworkbeer.com/
kubectl create secret tls afterworkbeer-com-tls --cert=fullchain1.pem --key=privkey1.pem -n fuebiapp

# Create wildcard cert
## General
- Install certbot
- Have access to DNS server (txt records)

## Create wildcard cert (with TXT record)
sudo certbot certonly --manual -d *.afterworkbeer.com -d afterworkbeer.com --agree-tos --no-bootstrap --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
- Deploy two times (because two domains) a TXT record _acme-challenge.afterworkbeer.com
cp /etc/letsencrypt/archive/afterworkbeer.com afterworkbeer.com/
sudo chmod -R 777 afterworkbeer.com/
kubectl create secret tls wild-afterworkbeer-com-tls --cert=fullchain1.pem --key=privkey1.pem -n fuebiapp


