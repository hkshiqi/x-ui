ifconfig eth0:1 10.0.0.5 up
ifconfig eth0:2 10.0.0.6 up
ifconfig eth0:3 10.0.0.7 up
ifconfig eth0:4 10.0.0.8 up
ifconfig eth0:5 10.0.0.9 up
ifconfig eth0:6 10.0.0.10 up
ifconfig eth0:7 10.0.0.11 up
ifconfig eth0:8 10.0.0.12 up
ifconfig eth0:9 10.0.0.13 up

iptables -t nat -I POSTROUTING -m owner --uid-owner v1 -j SNAT --to-source 10.0.0.5
iptables -t nat -I POSTROUTING -m owner --uid-owner v2 -j SNAT --to-source 10.0.0.6
iptables -t nat -I POSTROUTING -m owner --uid-owner v3 -j SNAT --to-source 10.0.0.7
iptables -t nat -I POSTROUTING -m owner --uid-owner v4 -j SNAT --to-source 10.0.0.8
iptables -t nat -I POSTROUTING -m owner --uid-owner v5 -j SNAT --to-source 10.0.0.9
iptables -t nat -I POSTROUTING -m owner --uid-owner v6 -j SNAT --to-source 10.0.0.10
iptables -t nat -I POSTROUTING -m owner --uid-owner v7 -j SNAT --to-source 10.0.0.11
iptables -t nat -I POSTROUTING -m owner --uid-owner v8 -j SNAT --to-source 10.0.0.12
iptables -t nat -I POSTROUTING -m owner --uid-owner v9 -j SNAT --to-source 10.0.0.13

runuser -l root -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/socks5/config.json &'
runuser -l v1 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk1.json &'
runuser -l v2 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk2.json &'
runuser -l v3 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk3.json &'
runuser -l v4 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk4.json &'
runuser -l v5 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk5.json &'
runuser -l v6 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk6.json &'
runuser -l v7 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk7.json &'
runuser -l v8 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk8.json &'
runuser -l v9 -c 'nohup /usr/local/x-ui/bin/xray-linux-amd64 -c /etc/sock5/sk9.json &'
