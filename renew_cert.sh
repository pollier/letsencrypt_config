#!/bin/bash
cd /root
rm -Rf letsencrypt
git clone https://github.com/letsencrypt/letsencrypt
cd /root/letsencrypt/
./letsencrypt-auto renew --standalone --standalone-supported-challenges http-01

rm /etc/pve/pve-root-ca.pem
rm /etc/pve/local/pve-ssl.key
rm /etc/pve/local/pve-ssl.pem

cp /etc/letsencrypt/live/lvdp.ovh/chain.pem /etc/pve/pve-root-ca.pem
cp /etc/letsencrypt/live/lvdp.ovh/privkey.pem /etc/pve/local/pve-ssl.key
cp /etc/letsencrypt/live/lvdp.ovh/cert.pem /etc/pve/local/pve-ssl.pem

service pveproxy restart
service pvedaemon restart
