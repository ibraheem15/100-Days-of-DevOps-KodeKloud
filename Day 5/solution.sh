# SELinux Installation and Disabling

# 1. Check the current status of SELinux:
sestatus

# 2. If SELinux is not installed, install it using the package manager:
sudo yum install -y selinux-policy selinux-policy-targeted

# 3. Disable SELinux permanently by editing the configuration file:
sudo sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# 4. Reboot the system to apply the changes:
sudo reboot