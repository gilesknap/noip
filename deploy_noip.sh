#!/bin/bash

echo
read -p "Deploy NOIP to the cluster using existing creds secret (y/n)? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    kubectl --namespace admin apply -f noip-deploy.yaml
else
    read -p "Noip User? " NOIP_USER
    read -p "Noip Password? " NOIP_PWD

    read -p "Deploy NOIP to the cluster with above creds (y/n)? " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        NOIP_PWD=$(echo $NOIP_PWD | base64)
        NOIP_USER=$(echo $NOIP_USER | base64)

        sed -e s/\$NOIP_PWD/"$NOIP_PWD"/ \
            -e s/\$NOIP_USER/"$NOIP_USER"/ \
            noip-secrets.yaml | kubectl --namespace admin apply -f -

        kubectl --namespace admin apply -f noip-deploy.yaml
    fi
fi
