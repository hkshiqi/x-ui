#!/bin/bash
echo "开始安装X-ui"
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
echo "开始下载必要文件"
wget --no-check-certificate -O /root/config.json https://raw.githubusercontent.com/hkshiqi/x-ui/main/config.json
chmod +x /root/config.json
runuser -l root -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /root/config.json &'
firewall-cmd --zone=public --add-port=20800/tcp --permanent
firewall-cmd --zone=public --add-port=20800/udp --permanent
firewall-cmd --reload
echo "============================="
echo "默认IP=本机IP"
echo "默认端口=20800"
echo "默认加密协议=aes-256-gcm"
echo "默认密码=aa321321"
echo "============================="
