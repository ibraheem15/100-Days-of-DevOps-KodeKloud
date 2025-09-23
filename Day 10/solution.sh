# Automated backup script for xfusioncorp news website

## First install nano (for easy editing) and zip (for compression)
sudo dnf install nano zip -y

## Create backup directory if it doesn't exist
sudo mkdir -p /backup
sudo chmod 777 /backup

## Create SSH key pair for passwordless login
ssh-keygen -t rsa -b 2048
ssh-copy-id clint@<ip>
# Replace <ip> with the actual IP address of the remote server
# You will be prompted to enter the password for the last time
# After this, you should be able to SSH into the remote server without a password

## Create a script to backup the news website
cd /script/

sudo nano backup_news.sh
# Add the following lines to the script:
cd /backup/
zip -r xfusioncorp_news.zip /var/www/html/news
scp xfusioncorp_news.zip clint@<ip>:/backup/
# Replace <ip> with the actual IP address of the remote server

## Make the script executable
sudo chmod +x backup_news.sh
## Test the script
./backup_news.sh