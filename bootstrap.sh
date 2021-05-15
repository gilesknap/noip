#!/bin/sh

set -e

echo "configuring noip2 ..."
cd noip-2*
mv noip2 /usr/local/bin
noip2 -C -c no-ip2.conf -u ${NOIP_USER} -p ${NOIP_PWD} -U 30 -Y

echo "starting noip2 ..."
mkdir -p /usr/local/etc
mv no-ip2.conf /usr/local/etc
noip2

echo "sleeping to keep container alive ..."
while true; do sleep 10; done
