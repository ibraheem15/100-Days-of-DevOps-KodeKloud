# . Install httpd, php and its dependencies on all app hosts.
sudo dnf -y install httpd php php-mysqlnd php-fpm

# b. Apache should serve on port 3002 within the apps.
sudo sed -i 's/Listen 80/Listen 3002/' /etc/httpd/conf/httpd.conf
# sed -i is used to edit the file in place
# 's/Listen 80/Listen 3002/' replaces the line that says "Listen 80" with "Listen 3002" in the httpd.conf file
sudo systemctl restart httpd

# c. Install/Configure MariaDB server on DB Server.
sudo dnf -y install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb


# d. Create a database named kodekloud_db9 and create a database user named kodekloud_top identified as password TmPcZjtRQx. Further make sure this newly created user is able to perform all operation on the database you created.
sudo mysql -e "CREATE DATABASE kodekloud_db9;"
sudo mysql -e "CREATE USER 'kodekloud_top'@'%' IDENTIFIED BY 'TmPcZjtRQx';"
# Adding '%' allows the user to connect from any host
sudo mysql -e "GRANT ALL PRIVILEGES ON kodekloud_db9.* TO 'kodekloud_top'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"
# -e allows you to run a single command and exit

