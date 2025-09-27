# Install Java 17
sudo dnf install -y java-17-openjdk-devel
java-17-openjdk
java -version

# Install Tomcat 9
cd /opt
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.109/bin/apache-tomcat-9.0.109.tar.gz
sudo tar -xvzf apache-tomcat-9.0.109.tar.gz
sudo mv apache-tomcat-9.0.109 tomcat
sudo rm -f apache-tomcat-9.0.109.tar.gz

# Create a tomcat user
sudo useradd -r -m -U -d /opt/apache-tomcat-9.0.109 -s /bin/false tomcat
sudo chown -R tomcat:tomcat /opt/apache-tomcat-9.0.109
sudo chmod +x /opt/apache-tomcat-9.0.109/bin/*.sh

# Create a systemd service file for tomcat
sudo nano /etc/systemd/system/tomcat.service

# Add the following lines to the file:
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target
[Service]
Type=oneshot
RemainAfterExit=yes
User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.16.0.8-2.el9.x86_64/"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"
Environment="CATALINA_BASE=/opt/apache-tomcat-9.0.109"
Environment="CATALINA_HOME=/opt/apache-tomcat-9.0.109"
Environment="CATALINA_PID=/opt/apache-tomcat-9.0.109/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ExecStart=/opt/apache-tomcat-9.0.109/bin/startup.sh
ExecStop=/opt/apache-tomcat-9.0.109/bin/shutdown.sh
[Install]
WantedBy=multi-user.target

# Reload the systemd daemon to apply the changes
sudo systemctl daemon-reload

# Start and enable the tomcat service
sudo systemctl start tomcat
sudo systemctl enable tomcat

# Check the status of the tomcat service
sudo systemctl status tomcat

# Open port 8080 in the firewall
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

# Verify tomcat is running by accessing it via curl
curl http://172.16.238.11:8080  

# You should see the tomcat welcome page HTML

# Check the tomcat logs to ensure it started correctly
sudo tail -f /opt/apache-tomcat-9.0.109/logs/catalina.out

# Change the default port from 8080 to 5002
cd /opt/apache-tomcat-9.0.109/conf
sudo nano server.xml

# Change the port from 8080 to 5002
# <Connector port="8080" protocol="HTTP/1.1"
# to
# <Connector port="5002" protocol="HTTP/1.1"

# Save and exit the file

# Restart tomcat to apply the changes
sudo systemctl restart tomcat

curl 172.16.238.11:5002
# You should see the tomcat welcome page HTML

# Open port 5002 in the firewall
sudo firewall-cmd --permanent --add-port=5002/tcp
sudo firewall-cmd --reload

# There is a ROOT.war file on Jump host at location /tmp. Deploy it on this tomcat server on port 5002.
sudo scp /tmp/ROOT.war steve@172.16.238.11:~

# Move the ROOT.war file to the webapps directory of tomcat
sudo mv ~/ROOT.war /opt/apache-tomcat-9.0.109/webapps/

# Wait for a few minutes and then check
curl 172.16.238.11:5002

# You should see the application running