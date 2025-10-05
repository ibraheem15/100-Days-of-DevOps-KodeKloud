# Install httpd package and dependencies on app server 1.
sudo dnf -y install httpd

# b. Apache should serve on port 5002.
sudo sed -i 's/Listen 80/Listen 5002/' /etc/httpd/conf/httpd.conf
sudo systemctl restart httpd

# c. There are two website's backups /home/thor/news and /home/thor/apps on jump_host. Set them up on Apache in a way that news should work on the link http://localhost:5002/news/ and apps should work on link http://localhost:5002/apps/ on the mentioned app server.
sudo mkdir -p /var/www/html/news
sudo mkdir -p /var/www/html/apps
sudo mkdir -p ~/newly_created_apps
sudo mkdir -p ~/newly_created_news

sudo chown -R tony:tony ~/newly_created_news
sudo chown -R tony:tony ~/newly_created_apps
sudo chown -R apache:apache /var/www/html/news
sudo chown -R apache:apache /var/www/html/apps
sudo chmod -R 755 /var/www/html/news
sudo chmod -R 755 /var/www/html/apps

sudo scp -r /home/thor/news/* tony@172.16.238.10:~/newly_created_news/
sudo scp -r /home/thor/apps/* tony@172.16.238.10:~/newly_created_apps/
sudo cp -r ~/newly_created_apps/* /var/www/html/apps/
sudo cp -r ~/newly_created_news/* /var/www/html/news/

# d. Once configured you should be able to access the website using curl command on the respective app server, i.e curl http://localhost:5002/news/ and curl http://localhost:5002/apps/
curl http://localhost:5002/news/
curl http://localhost:5002/apps/