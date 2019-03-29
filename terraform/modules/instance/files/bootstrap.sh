#!/bin/bash
sudo rm -rf /etc/letsencrypt
sudo rm -rf /var/www/vend
sudo rm -rf /var/www/portal
sudo rm -rf /var/www/*.zip
sudo rm -rf /etc/httpd/sites-available/*
sudo rm -rf /etc/httpd/conf/ssl.conf
sudo mkdir ~/.aws/
sudo touch ~/.aws/config
sudo echo [profile s3dev ] /n role_arn = arn:aws:iam::536891905259:role/S3accessResource /n credential_source = Ec2InstanceMetadata /n > ~/.aws/config
sudo aws s3 cp s3://v1sourcecode/v127032019.zip /var/www/ --profile s3dev
sudo unzip /var/www/*.zip
