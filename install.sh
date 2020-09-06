#!/bin/bash

set -e
sudo apt update

#install server
sudo apt install -y python3-venv
sudo mkdir -p /usr/share/webapp/bluetooth-control
sudo cp app.py /usr/share/webapp/bluetooth-control
sudo python3 -m venv /usr/share/webapp/bluetooth-control/venv
sudo chown -R pi:pi venv/
. /usr/share/webapp/bluetooth-control/venv/bin/activate
pip3 install uwsgi
pip3 install flask
sudo chown -R root:root venv/
sudo cp run.sh /usr/share/webapp/bluetooth-control/

#create service 
sudo cp bluetooth-control.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start bluetooth-control.service
sudo systemctl enable bluetooth-control.service

#install nginx
sudo apt install nginx
echo rrr1
sudo rm -f /etc/nginx/sites-enabled/default
echo rrr2
sudo cp bluetooth-control-proxy.conf /etc/nginx/sites-enabled/
sudo nginx -s reload
