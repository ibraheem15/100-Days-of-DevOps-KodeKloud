# The Nautilus application development team is planning to launch a new PHP-based application, which they want to deploy on Nautilus infra in Stratos DC. The development team had a meeting with the production support team and they have shared some requirements regarding the infrastructure. Below are the requirements they shared:



# a. Install nginx on app server 3 , configure it to use port 8093 and its document root should be /var/www/html.
sudo dnf -y install nginx
sudo sed -i 's/listen 80;/listen 8093;/' /etc/nginx/nginx.conf
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo mkdir -p /var/www/html
sudo chown -R nginx:nginx /var/www/html
sudo chmod -R 755 /var/www/html
  

# b. Install php-fpm version 8.3 on app server 3, it must use the unix socket /var/run/php-fpm/default.sock (create the parent directories if don't exist).
sudo dnf module reset php
sudo dnf module enable php:8.3 -y

sudo dnf -y install php-fpm
sudo mkdir -p /var/run/php-fpm
sudo chown -R nginx:nginx /var/run/php-fpm
sudo chmod -R 755 /var/run/php-fpm

# c. Configure php-fpm and nginx to work together.
sudo nano /etc/nginx/nginx.conf
# Change the following lines in the file

'
server {
    listen       8093;
    root         /var/www/html;
    index        index.php info.php;
   
    location ~ \.php$ {
        include fastcgi.conf;
        fastcgi_pass unix:/var/run/php-fpm/default.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
        fastcgi_index index.php;
    }
}
'

# Configure PHP-FPM pool
sudo nano /etc/php-fpm.d/www.conf
# Change the following lines in the file
'
listen = /var/run/php-fpm/default.sock

listen.owner = nginx
listen.group = nginx
listen.mode = 0660
'

# Start PHP-FPM
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Check services status
sudo systemctl status php-fpm
sudo systemctl status nginx

# Verify Socket Creation

# Check if socket was created
ls -la /var/run/php-fpm/default.sock

# If socket doesn't exist, restart PHP-FPM
sudo systemctl restart php-fpm
ls -la /var/run/php-fpm/default.sock