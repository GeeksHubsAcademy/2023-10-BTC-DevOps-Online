locals {
  user_data = <<-EOF
#!/bin/bash

################################
## INSTALACION AMAZON LINUX 2 ##
##        AMI PACKER          ##
################################
sudo yum update -y
sudo amazon-linux-extras install epel -y

#############################
## HERRAMIENTAS NECESARIAS ##
#############################
sudo yum install -y zip unzip git htop

## ESTABLECEMOS HUSO HORARIO
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime

#######################
## INSTALACION NGINX ##
#######################
sudo yum install -y nginx
sudo systemctl stop nginx

############################
##### APP INSTALL ######
############################
mkdir -p /usr/share/nginx/
cd /usr/share/nginx/
aws s3 cp s3://terraform-devops-dev/client-server/app.zip .
rm -rf html
unzip app.zip
mv app html
chown -R nginx:nginx ../nginx

#######################
## INITIAL NGINX ##
#######################
sudo systemctl start nginx 
sudo systemctl enable nginx
sudo systemctl status nginx
sudo chkconfig nginx on
EOF
}