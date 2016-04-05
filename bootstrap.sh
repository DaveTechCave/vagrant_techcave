#!/bin/bash

#
# Author: Devon J. Smith
# Provision vagrant machine web stack
#

# Link machine www dir to vagrant home

echo "Updating System..."
sudo apt-get update > /dev/null
sudo apt-get install -y apache2 > /dev/null

echo "Installing Web Development Environment..."
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-gd > /dev/null
sudo a2enmod php5 > /dev/null
sudo a2enmod rewrite > /dev/null

echo "Setting Configurations..."
cat >> /etc/apache2/apache2.conf << EOF
<Directory /var/www/html/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
EOF

sudo service apache2 restart
rm -f /var/www/html/index.hmtl
