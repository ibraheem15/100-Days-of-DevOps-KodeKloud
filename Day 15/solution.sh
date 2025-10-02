# Install and configure nginx on App Server 2
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

# there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.
sudo mv /tmp/nautilus.crt /etc/ssl/certs/nautilus.crt
sudo mv /tmp/nautilus.key /etc/ssl/private/nautilus.key
sudo chmod 600 /etc/ssl/private/nautilus.key

# Create an index.html file with content Welcome! under Nginx document root.
echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html
# sudo tee creates the file if it doesn't exist and writes the content to it.

# Configure Nginx to use the SSL certificate and key provided.
sudo bash -c 'cat > /etc/nginx/conf.d/nautilus.conf <<EOF
server {
    listen       443 ssl;
    server_name  localhost;
    ssl_certificate      /etc/ssl/certs/nautilus.crt;
    ssl_certificate_key  /etc/ssl/private/nautilus.key;
    ssl_session_cache    shared:SSL:1m;
    ssl_session_timeout  5m;
    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers  on;
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    } 
}
EOF'

# Restart Nginx to apply the changes.
sudo systemctl restart nginx