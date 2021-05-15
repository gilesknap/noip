# A simple example of deploying a service to kubernetes
## noip
A container build and Kubernetes deployment for NOIP Dynamic DNS Update client.

These scripts assume there is a namespace called admin to deploy the
service into,
If you dont have one:

```
kubectl create namespace admin
```

To deploy the noip DDNS client to your cluster
```
./deploy_noip.sh
```

See above script for details - it encodes the user and pwd in a cluster secret
and then creates a cluster deployment using the image defined in `Dockerfile`.

Go here to sign up for the free DDNS service https://www.noip.com/
