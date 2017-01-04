#!/bin/bash

#INSTALANDO AS DEPENDENCIAS
sudo apt-get update; sudo apt-get upgrade git -y;
sudo apt-get install apache2 php7.0 php7.0-common php7.0-fpm -y
sudo systemctl start apache2 ; sudo systemctl enable apache2;

#CLONA O PROJETINHO
sudo git clone https://github.com/msfidelis/AulaAWS-Superlogica.git /var/www/html/AulaAWS-Superlogica;
sudo chmod 777 /var/www/html/AulaAWS-Superlogica -R;

cp /var/www/html/AulaAWS-Superlogica/vhost.conf /etc/apache2/sites-enabled/;
sudo service apache2 restart;
