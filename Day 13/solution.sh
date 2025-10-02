
sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 5003 -j ACCEPT && sudo iptables -A INPUT -p tcp --dport 5003 -j DROP

sudo iptables -L -n --line-numbers | grep 5003
# We can see the rules for port 5003

# Now we will install iptables-services
sudo dnf install iptables-services -y
sudo service iptables save
sudo systemctl enable iptables
