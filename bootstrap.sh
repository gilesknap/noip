set -e

TGT=noip2

PREFIX=/usr/local
CONFDIR=${PREFIX}/etc
BINDIR=${PREFIX}/bin

cd noip-2*
cp ${TGT} ${BINDIR}/${TGT}

${BINDIR}/${TGT} -C -c /tmp/no-ip2.conf -u ${NOIP_USER} -p ${NOIP_PWD} -U 30 -Y
mkdir -p ${CONFDIR}
mv /tmp/no-ip2.conf ${CONFDIR}/no-ip2.conf
