# Temporary User Setup with Expiry

Setting up a temporary user on a Linux system with an expiration date can be useful for various scenarios, such as providing temporary access to contractors or for testing purposes. However, please note that having an expiration date does not delete the user automatically; it only disables the account after the specified date (the user will not be able to log in after that date).

## SSH into the server where you want to create the temporary user
```bash
ssh user@hostname
```

## Create a temporary user with an expiration date
```bash
sudo useradd -e 2024-12-31 tempuser
```

- **-e**: Sets the expiration date for the user account (YYYY-MM-DD format).
- **tempuser**: The username for the temporary user.

## Verify the user creation and expiration date
```bash
sudo chage -l tempuser
```

This command lists the account aging information for the user, including the expiration date.

## Use Cases:
- **Temporary Access**: Provide temporary access to contractors or temporary staff.
- **Testing**: Create temporary users for testing purposes without long-term impact.
- **Security**: Ensure that temporary accounts are automatically disabled after a certain period, reducing security risks.
## Cleanup
Once the temporary user is no longer needed, you can delete the user account:
```bash
sudo userdel tempuser
```

## Account Expiry vs Password Expiry
- **Account Expiry**: The account will be disabled after the specified date, preventing any login attempts.
- **Password Expiry**: The user will be required to change their password after a certain period, but the account remains active.
- **-e 2024-12-31** → expire account on that date.
- **-f 30** → after password expires, give 30 days to change it before disabling account.

### Example Timeline
Assume:

User is created on 2025-01-01

Password is set to expire in 90 days (via chage -M 90 testuser) → so expiry date = 2025-04-01

**Timeline:**

📅 2025-01-01 → User testuser created.

📅 2025-04-01 → Password expires. User can’t log in unless password is changed.

🔸 Because of **-f 30**:

📅 2025-05-01 → If password still not changed, account is locked due to inactivity.

🔸 Because of **-e 2025-04-04**:

📅 2025-04-04 → Account expires completely anyway, regardless of password.


## Merge SSH and User Creation Commands
You can combine the SSH command and the user creation command into a single line using a space
```bash
ssh user@hostname "sudo useradd -e 2024-12-31 tempuser"
```

But this has limitations:
- ssh only runs the terminal in non-interactive mode when a command is given along with ssh.
- If sudo requires a password, it will fail because there’s no way to enter the password.
- To avoid this, you can configure passwordless sudo for specific commands, but be cautious as it can pose security risks or use SSH keys with proper permissions.

<!-- In terms of automation we will look answers for the frequency of running this task on day to day basis? Do we need to automate this? Does automation efforts are justified? How to automate it -->

## Automation Ideas for Temporary User Setup
### 1. Automated Temporary User Creation Script

Automate the creation of temporary users with expiration dates using a shell script. This script can take parameters such as username and expiration date, making it easy to create users on demand.

## 2. Scheduled Cleanup Job
Set up a cron job to periodically check for and delete expired temporary users. This ensures that old accounts are cleaned up automatically without manual intervention.

## 3. Integration with User Management Systems
Integrate the temporary user creation process with existing user management systems or directories (like LDAP or Active Directory) to streamline user provisioning and de-provisioning.

## 4. Notification System
Implement a notification system that alerts administrators when temporary users are created and when they are about to expire. This can help in managing user accounts effectively.
