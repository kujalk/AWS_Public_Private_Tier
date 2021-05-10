#!/bin/bash
sudo apt-get install apache2 -y
sudo ufw allow 'Apache'
sudo systemctl start apache2.service
echo "Hello World !!!!!" > var/www/html/status.html