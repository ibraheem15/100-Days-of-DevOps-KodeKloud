# Revoke root ssh access

Root SSH access can pose significant security risks, as it provides unrestricted access to the system. Disabling root SSH access helps mitigate these risks by forcing users to log in with a non-privileged account and then escalate privileges using tools like `sudo`. This practice enhances security by ensuring that all actions taken on the server are traceable to individual user accounts.

## Use Cases:
- **Accountability**: By requiring users to log in with their own accounts, it becomes easier to track actions and changes made on the server. You will need to elevate privileges using `sudo`, which logs the commands executed and the user who executed them.
- **Protect Yourself from Yourself**: Disabling root login can prevent accidental changes or deletions of critical system files, as users must consciously choose to elevate their privileges.
- **Mitigation of Brute Force Attacks**: Disabling root login can help prevent brute force attacks targeting the root account because it eliminates the most common username (root). Attackers must guess both a valid username and password, increasing the difficulty and reducing the likelihood of success.
- **Least Privilege Principle**: Users can be granted only the permissions they need, reducing the risk of accidental or malicious changes to critical system files.

## Steps to Revoke Root SSH Access
1. **SSH into the server**:
   ```bash
   ssh user@hostname
   ```
2. **Edit the SSH configuration file**:
   ```bash
    sudo vi /etc/ssh/sshd_config
    ```
3. **Locate the line containing `PermitRootLogin`** and change its value to `no`:
   ```
    PermitRootLogin no
    ```
4. **Save the changes and exit the editor**.
5. **Restart the SSH service to apply the changes**:
   ```bash
   sudo systemctl restart sshd
   ```

### VI Editor Commands
- Press `i` to enter insert mode.
- Press `Esc` to exit insert mode.
- Type `:wq` and press `Enter` to save and exit.
- Type `:q!` and press `Enter` to exit without saving.
- Type `ctrl + f` to move forward one page.

  More info on VI editor: https://www.cs.colostate.edu/helpdocs/vi.html

## Automation Ideas
### 1. Automated SSH Configuration Management
Implement a configuration management tool (like Ansible, Puppet, or Chef) to enforce SSH settings across all servers. This can include disabling root login and ensuring consistent SSH configurations.

## Combining Terraform and Configuration Management Tools

### Provisioning with Terraform

You usually use something like **Terraform** to create your virtual machine. Terraform is responsible for provisioning the infrastructure—setting up servers (physical or virtual), networks, and other resources.

### Post-Provisioning Configuration

Once Terraform has finished setting things up, you need to configure your server or desktop. This includes tasks such as:

- Setting up WiFi/network
- Installing programs
- Configuring those programs

It's all the stuff you do after you are handed the server. After Terraform is done, it hands things over to configuration management tools.

### Configuration Management Tools

**Ansible, Chef, Puppet, SaltStack** all do the same things: they set up and configure your server (physical or virtual) **after** it has been provisioned. These tools automate the post-provisioning tasks to ensure consistency and repeatability.

### Applying Updates and Maintenance

Ansible is also great when it comes time to apply updates or patches. It's all about automating tasks that you do over and over again.  
> **Note:** These tools are **not for code deployment**. They are used to configure and maintain your environments.

### Use Case: Training and Testing Environments

Another great use-case is for setting up training or testing environments:

1. Use **Terraform** to create your environments.
2. Use **Ansible, Chef, Puppet, SaltStack** to configure your environments in various configurations with the push of a button.
3. Automate the deployment of your code or clients.
4. Run your training or testing.
5. Tear it all down and repeat.

It's no sweat when it's all automated, documented, and repeatable! That will make you a Master QA person!

### 2. Centralized Logging and Monitoring
Set up centralized logging for SSH access attempts and monitor these logs for any unauthorized access attempts. This can help in quickly identifying and responding to potential security incidents.

### 3. User Access Reviews
Automate periodic reviews of user access rights and SSH keys. This can help ensure that only authorized users have access to the system and that old or unused keys are removed.

### 4. Integration with Identity and Access Management Systems
Integrate SSH access controls with existing identity and access management systems to streamline user provisioning and de-provisioning. This can help ensure that access rights are always up-to-date and in line with organizational policies.