# ! Server 1 Problem
sudo systemctl stop sendmail
sudo systemctl disable sendmail

systemctl status httpd.service
sudo systemctl restart httpd

#* httpd (pid 1102) already running
#* kill: cannot find process ""
#* httpd.service: control process exited, code=exited status=1
#* Failed to start The Apache HTTP Server.

#* means systemd tried to start Apache (httpd), but an old instance is still running in the background.


ps aux | grep httpd

sudo kill -9 $(pidof httpd)

# ! Server 2 Problem
# Install httpd
sudo dnf install httpd -y

# Check which port httpd is listening on
sudo ss -tulpn | grep httpd

# ! Server 3 Problem
# No error

