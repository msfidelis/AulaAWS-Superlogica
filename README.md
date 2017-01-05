
## Slides

Todos os slides com o conteúdo da aula podem ser encontrados no Slideshare:
* [Link da Palestra](http://www.slideshare.net/MatheusFidelis1/desmistificando-a-amazon-aws)


## Checklist simplista de Deploy

- [ ] Instalamos nosso PHP7.0, Apache, Git e fazemos nossas configurações mínimas para rodar o projeto. 

- [ ] Clonamos nosso projeto do Github, nos certificamos que o mesmo possui as permissões adequadas para funcionar, deletamos nossos Virtualhosts do Apache e configuramos um novo ideal para o projeto. 

- [ ] Instalamos o gerenciador de dependências Composer para satisfazer as dependências de bibliotecas de terceiros do projeto e fazer nosso Autoload. 

- [ ] Resolvemos as dependências e reiniciamos o Apache para garantir as modificações. 


# Configuração do ambiente - Processo de Deploy! 

## INSTALANDO AS DEPENDENCIAS
``` Shell
sudo apt-get update; sudo apt-get upgrade git -y;
sudo apt-get install apache2 php7.0 php7.0-common php7.0-fpm libapache2-mod-php7.0 -y;
sudo systemctl start apache2 ; sudo systemctl enable apache2;
sudo a2enmod rewrite;
```

## CLONANDO O PROJETINHO
``` Shell
sudo git clone https://github.com/msfidelis/AulaAWS-Superlogica.git /var/www/html/AulaAWS-Superlogica;
sudo chmod 777 /var/www/html/AulaAWS-Superlogica -R; cd /var/www/html/AulaAWS-Superlogica/; git config core.fileMode false;
sudo rm -r /etc/apache2/sites-enabled/*;
sudo cp /var/www/html/AulaAWS-Superlogica/vhost.conf /etc/apache2/sites-enabled/;
```

## INSTALA O COMPOSER
``` Shell
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"
```
## RESOLVE AS DEPENDÊNCIAS
``` Shell
cd /var/www/html/AulaAWS-Superlogica/app/ ; composer install;
sudo service apache2 restart;
```
