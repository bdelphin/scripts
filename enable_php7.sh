#!/bin/bash

# Enable PHP7 & disable PHP8
# write permissions needed on /etc/httpd/conf/httpd.conf


# disable php8
sed -i '/Include conf\/extra\/php_module.conf/c\#Include conf\/extra\/php_module.conf' /etc/httpd/conf/httpd.conf
sed -i '/LoadModule php_module modules\/libphp.so/c\#LoadModule php_module modules\/libphp.so' /etc/httpd/conf/httpd.conf
sed -i '/AddHandler php-script .php/c\#AddHandler php-script .php' /etc/httpd/conf/httpd.conf

#enable php7
sed -i '/#Include conf\/extra\/php7_module.conf/c\Include conf\/extra/php7_module.conf' /etc/httpd/conf/httpd.conf
sed -i '/#LoadModule php7_module modules\/libphp7.so/c\LoadModule php7_module modules\/libphp7.so' /etc/httpd/conf/httpd.conf
sed -i '/#AddHandler php7-script .php/c\AddHandler php7-script .php' /etc/httpd/conf/httpd.conf

# restart apache
# nopasswd in sudoers must be specified !
sudo systemctl restart httpd.service

DISPLAY=:0 notify-send "PHP7 enabled." -u normal
