# Install cronie and add a cron job that writes "hello" to /tmp/cron_text every 5 minutes.

sudo yum install -y cronie
sudo systemctl enable crond
sudo systemctl start crond

ssh user@hostname

echo '*/5 * * * * echo hello > /tmp/cron_text' | sudo crontab -