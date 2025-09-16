# Give execution permission to everyone for the script 

Permissions for each file may vary based on your requirements. There are many ways to set permissions. Command line options can be of two types; symbolic and octal. 
You can use either method to set permissions.
You can use this tool whereby you can tick the options you want and it gives you the command:
https://ss64.com/bash/chmod.html

for example; chmod a+x /path/to/your/script.sh = chmod 755 /path/to/your/script.sh

### Only Execution Permission
Giving only execution permission without read permission will not work because the system needs to read the file to execute it. Therefore, at least read permission is required along with execution permission. However, binary file needs only execution permission.

## Use Cases:
- **Least Privilege Principle**: By disabling files and directories from being executed by unauthorized users, you minimize the risk of accidental or malicious execution of scripts that could compromise system security.
- **Preventing Accidental Execution**: Restricting execution permissions can prevent users from accidentally running scripts that they do not fully understand, which could lead to unintended consequences.


## Steps to Set Execution Permissions:
1. **Connect to the Server**: Use SSH to connect to the server where the script is located.
   ```bash
   ssh user@hostname
   ```
   Replace `user` with your username and `hostname` with the server's address.
2. **Set Execution Permissions**: Use the `chmod` command to set the appropriate execution permissions for the script. For example, to give execution permission to everyone:
   ```bash
    sudo chmod a+x /path/to/your/script.sh
    ```
    Replace `/path/to/your/script.sh` with the actual path to your script.
3. **Verify Permissions**: You can verify the permissions using the `ls -l` command:
   ```bash
    ls -l /path/to/your/script.sh
    ```

## Automation Ideas
### 1. Bash Script for Setting Permissions
You can create a bash script that takes a file path as an argument and sets the execution permissions automatically.

### 2. Ansible Playbook
You can use Ansible to automate the process of setting execution permissions across multiple servers. Here is a simple Ansible playbook example:

### 3. SSH and Execute Command
You can create a script that uses SSH to connect to the server and execute the `chmod` command remotely.
```bash
#!/bin/bash
ssh user@hostname "sudo chmod a+x /path/to/your/script.sh"
```
Replace `user`, `hostname`, and `/path/to/your/script.sh` with appropriate values.
But this method requires SSH keys to be set up for passwordless authentication or you can merge it with the `sudo -A` method mentioned in Day 2.
