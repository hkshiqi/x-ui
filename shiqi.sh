#!/bin/bash
#系统性能优化
echo 500000 >/proc/sys/kernel/pid_max
echo 500000 >/proc/sys/kernel/threads-max
echo 500000 >/proc/sys/vm/max_map_count
echo 500000 >/proc/sys/fs/file-max
ulimit -SHn 10240
ulimit -SHs unlimited
modprobe ip_conntrack
echo 1000000 >/proc/sys/net/nf_conntrack_max
lsmod |grep conntrack

#安装nginx
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

#安装X-UI
echo "开始安装X-ui"
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
echo "开始下载必要文件"
mkdir /etc/socks5
chmod +x /etc/socks5
rm -rf /etc/socks5/config.json
wget --no-check-certificate -O /etc/socks5/qd.sh https://raw.githubusercontent.com/hkshiqi/x-ui/main/socks5/qd.sh
wget --no-check-certificate -O /etc/socks5/config.json https://raw.githubusercontent.com/hkshiqi/x-ui/main/socks5/config.json
chmod +x /etc/socks5/qd.sh
chmod +x /etc/socks5/config.json
wget --no-check-certificate -O /lib/systemd/system/qd.service https://raw.githubusercontent.com/hkshiqi/x-ui/main/socks5/qd.service
sudo systemctl daemon-reload
systemctl enable qd.service
cd /etc/socks5
./qd.sh

#防火墙放行端口
firewall-cmd --zone=public --add-port=20510/tcp --permanent
firewall-cmd --zone=public --add-port=20510/udp --permanent
firewall-cmd --reload

#安装启动BBR
wget --no-check-certificate -O /etc/socks5/bbr.sh https://raw.githubusercontent.com/hkshiqi/x-ui/main/installbbr/bbr && chmod +x /etc/socks5/bbr.sh && ./bbr.sh

#shadowsocks信息输出
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
