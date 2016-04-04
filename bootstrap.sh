#!/bin/bash

#
# Author: Devon J. Smith
# Provision vagrant machine web stack
#

# Link machine www dir to vagrant home
sudo apt-get update
sudo apt-get install -y apache2

sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-gd
sudo a2enmod php5
sudo a2enmod rewrite

cat >> /etc/apache2/apache2.conf << EOF
<Directory /var/www/html/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
EOF

sudo service apache2 restart
