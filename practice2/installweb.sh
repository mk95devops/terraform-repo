#!/bin/bash 
sudo yum update -y 
sudo yum install httpd -y 
systemctl start httpd 
systemctl enable httpd 
echo "<h1>Hello Terraform Web Bootstrap Is Successfully Installed</h1>" >/var/www/html/index.html