#!/bin/bash
echo "开始安装X-ui"
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
echo "开始下载必要文件"
wget --no-check-certificate -O /root/config.json https://raw.githubusercontent.com/hkshiqi/x-ui/main/config.json
chmod +x /root/config.json
runuser -l root -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /root/config.json &'
