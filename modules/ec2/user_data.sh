#!/bin/bash
apt-get update -y
apt-get install -y nginx docker.io
systemctl start nginx
systemctl enable nginx
systemctl start docker
systemctl enable docker
