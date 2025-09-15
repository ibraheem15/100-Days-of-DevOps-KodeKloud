# Install SELinux and set it to disabled mode.

If we are given a random linux machine, we need to first check which linux distribution is installed. Based on that we can install the SELinux package and set it to disabled mode. 

SELinux is a security module in Linux that provides an additional layer of access control. Its purpose is to enforce fine-grained, context-based access control that goes beyond traditional UNIX/Linux permissions (user/group/others and discretionary access control).

In simple terms:

- Normal Linux permissions decide who can access what based on ownership and modes (rwx).

- SELinux decides how a process can use a resource (file, port, socket, device) based on security policies and labels.

- Even if root (UID 0) wants to do something outside the policy, SELinux can deny it.

## Use Cases:
- **Containment of Compromised Services**: If a service (like a web server) is compromised, SELinux can limit the actions that the compromised service can perform, reducing the potential damage.
- **Protection of Sensitive Files**: SELinux can prevent unauthorized access to sensitive files, even if a user has root privileges.
- **Mitigation of Zero-Day Exploits**: SELinux can provide a layer of defense against unknown vulnerabilities in applications by restricting their capabilities.

### Scenario:
You're deploying a new application to a web/application server that has been delivered from the software team. This is a black box to you, so you don't know how many injection and overrun attacks this application is vulnerable to. Before you know it, somebody is escalating their privileges on your server running the commands through an exploit in the app. They go for your shadow file and the password hashes therein to proceed to a rainbow table attack...and that's where SELinux stops them. /etc/shadow can't be read by apache, even if it's running as root, because it doesn't have a SELinux label allowing it.

Now, should you have to depend on an extra security module to make up for your software team's sloppy coding? No, and hopefully you won't, but this is an example of how SELinux can shield you from zero-day attacks. Layered defense is a real thing, and a very important thing.


## Steps to Install and Disable SELinux:
1. **Connect to the Server**: Use SSH to connect to the server where you want to install and disable SELinux.
   ```bash
   ssh user@hostname
   ```
   Replace `user` with your username and `hostname` with the server's address.
2. **Check the Linux Distribution**: Determine the Linux distribution to use the appropriate package manager.
   ```bash
    cat /etc/*release
    ```
3. **Install SELinux**: Use the appropriate package manager to install SELinux. For example, on a Red Hat-based system:
   ```bash
    sudo yum install selinux-policy selinux-policy-targeted -y
    ```
    On a Debian-based system:
   ```bash
    sudo apt-get install selinux-basics selinux-policy-default -y
   ```
4. **Disable SELinux**: Edit the SELinux configuration file to disable it.
   ```bash
    sudo vi /etc/selinux/config
    ```
    Change the line `SELINUX=enforcing` to `SELINUX=disabled`.
5. **Reboot the System**: Reboot the system to apply the changes.
   ```bash
    sudo reboot
    ```

## Automation Ideas
### 1. Scripted Installation
Create a shell script that automates the entire process of checking the Linux distribution, installing SELinux, disabling it, and rebooting the system. This script can be reused across multiple servers to ensure consistency.

### 2. One command Execution
You can create a single command that combines all the steps into one line using `&&` to chain commands. This can be useful for quick execution on a new server.
```bash
ssh user@hostname "if [ -f /etc/redhat-release ]; then sudo yum install selinux-policy selinux-policy-targeted -y; elif [ -f /etc/debian_version ]; then sudo apt-get install selinux-basics selinux-policy-default -y; fi && sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config && sudo reboot"
```
Replace `user` and `hostname` with appropriate values.
Make sure to have SSH keys set up for passwordless authentication or you can merge it with the `sudo -A` method mentioned in Day 2.

