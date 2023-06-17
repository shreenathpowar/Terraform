#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y

sudo chmod 777 /var/www/html/index.nginx-debian.html
sudo echo '<h1>Hey, Nginx here!</h1>' > /var/www/html/index.nginx-debian.html
