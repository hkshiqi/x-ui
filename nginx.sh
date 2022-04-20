#!/bin/bash
apt-get install epel-release -y
apt-get update -y -y
apt-get install -y nginx
apt-get install nginx-mod-stream
wget --no-check-certificate -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/hkshiqi/x-ui/main/nginx/nginx.conf
chmod 777 /etc/nginx/nginx.conf
mkdir /etc/nginx/zf.d
chmod 777 /etc/nginx/zf.d
wget --no-check-certificate -O /etc/nginx/zf.d/trujan.conf https://raw.githubusercontent.com/hkshiqi/x-ui/main/nginx/zf.d/trojan.conf
chmod 777 /etc/nginx/zf.d/trujan.conf
systemctl restart nginx
