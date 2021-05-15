# A simple example of deploying a service to kubernetes
## noip
A container build and Kubernetes deployment for NOIP Dynamic DNS Update client

These scripts assume there is a namespace called admin to deploy the service into,
If you dont have one:

```
kubectl create namespace admin
```

To build the container (replace gilesknap with your docker hub user)
```
cd <root of this repo>
docker build -t gilesknap/noip .
docker push gilesknap/noip
```

To deploy to your cluster
```
./deploy_noip.sh
```

See above script for details - it encodes the user and pwd in a secret and
then creates a deployment that uses the above image.

NOTE: if you have built your own image and pushed to docker hub  then change
the line in
noip-deploy.yaml that specfies the image as gilesknap/noip
