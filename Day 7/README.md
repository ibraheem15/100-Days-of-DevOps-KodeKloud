# Passwordless SSH Setup 
## Objective
The objective of this exercise is to set up passwordless SSH access between two machines.
SSH passwordless login is an SSH authentication method that employs a pair of public and private keys for asymmetric encryption. The public key resides on the server, and only a client that presents the private key can connect.


## Use Cases:
1. **Automated Scripts**: Automate tasks across multiple servers without manual password entry.
2. **Frequent Access**: Users who frequently access remote servers can do so more efficiently.
3. **Enhanced Security**: Reduces the risk of password theft or brute-force attacks.
4. **DevOps and CI/CD**: Facilitates seamless integration and deployment processes.

## Drawbacks:
**Key Management**: Requires careful management of private keys to prevent unauthorized access. You can use passphrases to protect private keys.  A local caching program such as ssh-agent or gnome-keyring allows you to enter that passphrase periodically, so you don't have to enter it every time you use the key.

## Steps
1. Generate SSH Key Pair
2. Copy Public Key to Remote Server
3. Test Passwordless SSH Login

## Automation Ideas
### 1. Multiple Servers
Create a script that takes a list of server IPs or hostnames and automates the process of copying the public key to each server.
### 2. Key Rotation
Develop a script that periodically generates a new SSH key pair and updates the public key on all remote servers.
### 3. Centralized Management
Implement a centralized system to manage SSH keys and distribute public keys to authorized servers.

