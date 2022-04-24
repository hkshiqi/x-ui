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
echo "开始安装X-ui"
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
echo "开始下载必要文件"
mkdir /etc/socks5
chmod +x /etc/socks5
rm -rf /etc/socks5/config.json
wget --no-check-certificate -O /etc/socks5/qd.sh https://raw.githubusercontent.com/hkshiqi/x-ui/main/qd.sh
wget --no-check-certificate -O /etc/socks5/config.json https://raw.githubusercontent.com/hkshiqi/x-ui/main/config.json
chmod +x /etc/socks5/qd.sh
chmod +x /etc/socks5/config.json
chmod +x /etc/rc.d/rc.local
echo /etc/socks5/qd.sh >> /etc/rc.d/rc.local
ln -fs /lib/systemd/system/rc-local.service /etc/systemd/system/rc-local.service
cat>/etc/systemd/system/rc-local.service<<EOF
[Install]
WantedBy=multi-user.target
Alias=rc-local.service
EOF
touch /etc/rc.local
chmod 777 /etc/rc.local
echo /etc/socks5/qd.sh >> /etc/rc.local

cd /etc/socks5
./qd.sh
firewall-cmd --zone=public --add-port=20510/tcp --permanent
firewall-cmd --zone=public --add-port=20510/udp --permanent
firewall-cmd --reload
echo ""
echo ""
echo ""
echo "============================="
echo "默认IP=本机IP"
echo "默认端口=20001"
echo "默认加密协议=aes-256-gcm"
echo "默认密码=aa321321"
echo "============================="
echo ""
echo ""
echo ""
echo ""
