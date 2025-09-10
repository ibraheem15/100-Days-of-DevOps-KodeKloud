# Linux User Setup with Non-Interactive Shell

## What is Non-Interactive Shell?
A non-interactive shell is a shell session that does not require user interaction.

A (sub)shell that is probably run from an automated process. You will see neither input nor output when the calling process doesn't handle it. That shell is normally a non-login shell, because the calling user has logged in already.

It’s a special shell that prevents the user from logging in interactively (via SSH, console, etc.). If someone tries to log in as that user, the system just shows a polite message like “This account is currently not available” and exits. The user can still own files, run scheduled jobs (cron), or be used by services/daemons.

## Why Use Non-Interactive Shell (Use Cases)
- Security: Non-interactive shells can enhance security by preventing unauthorized access to a user account.
  - Attackers often try SSH brute-force on known usernames like ftp, mysql, postgres.
    With /sbin/nologin, even if they guess the password, they still can’t log in.
- Automation: Non-interactive shells are ideal for automating tasks, such as system administration or batch processing.
- Efficiency: Non-interactive shells can execute commands faster since they do not wait for user input.
- Background Processes: They are useful for running background processes that do not require user interaction.
- Backup and Maintenance: Non-interactive shells can be used for backup scripts or maintenance tasks that run without user intervention.
- Service Accounts: They are often used for service accounts that need to run specific applications or services without allowing interactive logins (e.g., web servers, database servers, nginx).

## Interactive vs Non-Interactive Shell
| Feature               | Interactive Shell                     | Non-Interactive Shell                |
|-----------------------|--------------------------------------|-------------------------------------| 
| User Input            | Requires user input                   | Does not require user input         |
| Prompt                | Displays a prompt                     | No prompt displayed                  |
| Execution             | Executes commands one at a time       | Executes commands in batch           |
| Use Case              | Ideal for manual tasks                | Ideal for automation and scripting   |
| Error Handling        | May pause for user input on errors    | Continues execution or exits on errors |
| Examples              | Bash shell, Zsh shell                 | Shell scripts, cron jobs             |

Non-interactive shells are typically used to execute a file or a string of code, while interactive shells function like a normal terminal (e.g., you can type “ls”, get the results back, run “cd”, etc.). The non-interactive shell just performs a task and stops, while the interactive shell allows for back-and-forth communication.

Run the executable and get a prompt, that's interactive. Run a script that uses the shell as an execution environment, that's non interactive.

## Setting Up a Non-Interactive Shell with newuser
To create a new user with a non-interactive shell, you can use the following command:

```bash
sudo useradd -m -s /usr/sbin/nologin newuser
```
In this command:
- `sudo`: Runs the command with superuser privileges.
- `useradd`: The command to add a new user.
- `-m`: Creates a home directory for the new user.
- `-s /usr/sbin/nologin`: Sets the shell to `/usr/sbin/nologin`, which is a non-interactive shell that prevents login.
- `newuser`: The username for the new user.

## Using Non-Interactive Shell 
Once the user is created, you can use this non-interactive shell for various tasks, such as running scripts or scheduled jobs without requiring user interaction.

For example, you can run a script as the new user using `sudo`:

```bash
sudo -u newuser /path/to/your/script.sh
```
This command runs the specified script as `newuser`, utilizing the non-interactive shell.
- -u myserviceuser → run as that user.

## Automation Ideas for Non-Interactive Shells
### 1. Automated User Creation and Script Execution

  This idea demonstrates how to automate the process of creating a random user on a Linux system, running a script as that user, and then deleting the user—all using Go.

  **Use cases**:
  - Automated Testing: Create temporary users for testing purposes.
  - Script Execution: Run scripts in isolated environments.
  - Cleanup: Ensure no residual users remain after tasks are completed.

  

### 2. Scheduled Maintenance Tasks

  Use non-interactive shell user to run scheduled maintenance tasks, such as backups or system updates, without requiring user intervention.

  **Use casess**:
  - Only allow specific users to run maintenance tasks.
  - Prevent interactive logins for security.
