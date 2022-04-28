#!/bin/bash
echo 500000 >/proc/sys/kernel/pid_max
echo 500000 >/proc/sys/kernel/threads-max
echo 500000 >/proc/sys/vm/max_map_count
echo 500000 >/proc/sys/fs/file-max
ulimit -SHn 10240
ulimit -SHs unlimited
modprobe ip_conntrack
echo 1000000 >/proc/sys/net/nf_conntrack_max
lsmod |grep conntrack

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
#echo /etc/socks5/qd.sh >> /etc/rc.local
#echo 'exit 0' >> /etc/rc.local
#echo "runuser -l root -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/socks5/config.json &'" >> /etc/rc.local
wget --no-check-certificate -O /lib/systemd/system/qd.service https://raw.githubusercontent.com/hkshiqi/x-ui/main/qd.service
sudo systemctl daemon-reload
systemctl enable qd.service
cd /etc/socks5
./qd.sh
firewall-cmd --zone=public --add-port=20510/tcp --permanent
firewall-cmd --zone=public --add-port=20510/udp --permanent
firewall-cmd --reload
wget --no-check-certificate -O /etc/socks5/bbr.sh https://raw.githubusercontent.com/hkshiqi/x-ui/main/bbr && chmod +x /etc/socks5/bbr.sh && ./bbr.sh
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
