#!/bin/bash
MYBACKUPDIR=/backup/$(hostname)/$(date +%Y%m%d)
sudo mkdir -p ${MYBACKUPDIR}/etc/sysconfig
sudo cp -aR /etc/origin ${MYBACKUPDIR}/etc
sudo cp -aR /etc/docker ${MYBACKUPDIR}/etc
sudo cp -aR /etc/sysconfig/atomic-* ${MYBACKUPDIR}/etc/sysconfig/
sudo mkdir -p ${MYBACKUPDIR}/etc/pki/ca-trust/source/anchors
sudo cp -aR /etc/sysconfig/{iptables,docker-*,flanneld} ${MYBACKUPDIR}/etc/sysconfig/
sudo cp -aR /etc/dnsmasq* /etc/cni ${MYBACKUPDIR}/etc/
sudo cp -aR /etc/pki/ca-trust/source/anchors/* ${MYBACKUPDIR}/etc/pki/ca-trust/source/anchors/
rpm -qa | sort | sudo tee $MYBACKUPDIR/packages.txt
sudo tar -zcvf /backup/$(hostname)-$(date +%Y%m%d).tar.gz $MYBACKUPDIR
sudo rm -Rf ${MYBACKUPDIR}
