# First check on which port app servers are listening to httpd service
sudo ss -tulpn | grep httpd
# All app servers are listening on port 5000/tcp

# Install nginx
sudo dnf install nginx -y

# Configure load-balancing with the an http context making use of all App Servers. Ensure that you update only the main Nginx configuration file located at /etc/nginx/nginx.conf

upstream app_servers {
    server  172.16.238.10:5000;
    server  172.16.238.11:5000;
    server  172.16.238.12:5000;
}

# add the following server block inside the http context
server {

    listen       80;
    server_name  localhost;

    location / {
        proxy_pass http://app_servers;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}


sudo systemctl start nginx
sudo systemctl enable nginx
