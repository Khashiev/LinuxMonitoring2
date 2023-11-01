#!/bin/bash

if [[ $# -ne 0 ]]; then
    echo "Incorrect input"
else
    sudo apt install -y nginx
    chmod +x info.sh
    . ./info.sh

    sudo cp ./nginx.conf /etc/nginx/nginx.conf
    sudo nginx -s reload

    sudo cp index.html /usr/share/nginx/html/index.html

    sudo cp ./prometheus.yml /etc/prometheus/prometheus.yml
    sudo systemctl restart prometheus.service

    while sleep 5; do
        ./info.sh
        sudo cp index.html /usr/share/nginx/html/index.html
    done
fi
