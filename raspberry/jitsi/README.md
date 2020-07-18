## Install guide for kubernetes

This guide will deploy fuebiapp in the most simple way: as several containers in a single pod. This is enough to start in case your hardware is enough. If you need to scale components to severa instance, you'll have to modify it to use several services and pods.

Create a namespace to deploy fuebiapp to:

```
kubectl create namespace fuebiapp
```


Add the secret with secret values (replace ... with some random strings):

```
kubectl create secret generic fuebiapp-config -n fuebiapp --from-literal=JICOFO_COMPONENT_SECRET=... --from-literal=JICOFO_AUTH_PASSWORD=... --from-literal=JVB_AUTH_PASSWORD=...
```

Deploy the service to listen for JVB UDP traffic on all cluster nodes port 10000:

**IMPORTANT** This service is from type LoadBalancer and gets an own public IP. This IP needs to be set as DOCKER_HOST_ADDRESS in ENV in the deployment.yaml. Also you have to forward UDP/10000 from your router to this IP. 

```
kubectl create -f jvb-service.yaml
```

Now we can deploy the rest of the application. First modify the DOCKER_HOST_ADDRESS env value in deployment.yaml to point to one of nodes in your cluster (or load-balancer for all nodes if you have one), and then deploy it:

```
kubectl create -f deployment.yaml
```

To expose the webapp, we can use Ingress (replace the host value with your actual hostname):

```
kubectl create -f web-service.yaml
```

You can either use "https" or "http" service port, depending on whether your ingress allows self-signed certs.

