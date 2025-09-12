# Revoke root ssh access on all app servers

ssh user@hostname 
sudo vi /etc/ssh/sshd_config
# Change PermitRootLogin to no
sudo systemctl restart sshd
exit