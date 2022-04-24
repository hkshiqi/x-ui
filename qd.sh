#!/bin/shell
runuser -l root -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/socks5/config.json &'
exit 0
