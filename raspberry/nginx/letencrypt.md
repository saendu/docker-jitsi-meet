#Create Letencrypt Cert
##General
Make sure that DNS points to kubernetes cluster (A-record or CNAME)

##Kubernetes deployment
kubectl apply -f deployment.yaml 
kubectl apply -f service.yaml 
kubectl apply -f notls.yaml 

##Inside pod
kubectl exec -it nginx-deployment-7d4f6766d4-jz225 -- /bin/bash
certbot certonly --webroot --webroot-path /usr/share/nginx/html -d meet.afterworkbeer.com -d afterworkbeer.com

##create secret
kubectl cp default/nginx-deployment-7d4f6766d4-jz225:/etc/letsencrypt/archive/meet.afterworkbeer.com ~/cert/afterworkbeer.com/
kubectl create secret tls afterworkbeer-com-tls --cert=fullchain1.pem --key=privkey1.pem -n fuebiapp