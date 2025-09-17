# Passwordless SSH Setup
# This script sets up passwordless SSH login from the local machine to a remote server.

# Create an SSH key pair if it doesn't already exist
ssh-keygen -t rsa -b 2048
# -t rsa: Specifies the type of key to create, in this case, an RSA key.
# -b 2048: Specifies the number of bits in the key, 2048 bits is a good balance between security and performance.

# Copy the public key to the remote server
# Replace 'user' with your remote username and 'remote_host' with the remote server's IP address or hostname.
ssh-copy-id user@remote_host
# This command appends the local machine's public key to the remote server's ~/.ssh/authorized_keys file.
# You will be prompted to enter the remote user's password for the last time.
# After this, you should be able to SSH into the remote server without a password.