#!/bin/bash
apt-get install epel-release -y
apt-get update -y -y
apt-get install -y nginx
apt-get install nginx-mod-stream
