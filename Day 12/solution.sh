# Check Apache Httpd error and then access it via curl from another server

# First check if httpd is running
sudo systemctl status httpd
# Https is failed to start because port 5000 is already in use
# We will check which process is using port 5000
sudo netstat -tulnp | grep 5000
# We can see that sendmail is using port 5000
# We will stop and disable sendmail
sudo systemctl stop sendmail
sudo systemctl disable sendmail

# Now we will start httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# But we can access httpd from only localhost so to fix this we will add 0.0.0.0 in Listen directive
cd /etc/httpd/conf

sudo vi httpd.conf
# Change Listen 5000 to Listen 0.0.0.0:5000
Listen 0.0.0.0:5000
# Save and exit the file with :wq

# Restart httpd to apply the changes
sudo systemctl restart httpd

# Now we will add port 5000 in the iptables
sudo iptables -I INPUT -p tcp --dport 5000 -j ACCEPT
sudo service iptables save
sudo systemctl restart iptables

# Now we will access httpd from another server using curl
curl http://stapp01:5000

