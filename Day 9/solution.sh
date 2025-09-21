# Fix MariaDB issue

# Reinstall MariaDB server
sudo dnf remove mariadb-server -y
sudo dnf install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb