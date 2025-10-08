# Utilize yum to install the git package on the Storage Server.
sudo dnf -y install git

# Create a bare repository named /opt/official.git (ensure exact name usage).
sudo git init --bare /opt/official.git

# sudo is used to ensure the command is run with superuser privileges, which is necessary for creating directories and initializing repositories in system-level paths like /opt.

# A bare git repository is a a repository without a working directory. It is basically only the .git folder of your regular git repository without the checked out files that you can edit.

# It is useful for repositories on a server, where no work should be happening in that repository. That means a directory that is not used for editing files, building your project or running tests.

# It reduces the amount of disc space needed and still permits cloning, pushing, pulling and fetching (probably more I forgot about). It does not work well for add and commit, because it has no working directory.