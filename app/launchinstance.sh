#!/bin/bash

#INSTALANDO AS DEPENDENCIAS
sudo apt-get update; sudo apt-get upgrade git -y;
sudo apt-get install apache2 php7.0 php7.0-common php7.0-fpm -y
sudo systemctl start apache2 ; sudo systemctl enable apache2;
