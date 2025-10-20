# The Nautilus application development team has been working on a project repository /opt/apps.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with the DevOps team:



# There are two branches in this repository, master and feature. One of the developers is working on the feature branch and their work is still in progress, however they want to merge one of the commits from the feature branch to the master branch, the message for the commit that needs to be merged into master is Update info.txt. Accomplish this task for them, also remember to push your changes eventually.
cd /usr/src/kodekloudrepos
sudo git checkout master
sudo git pull origin master
# Find the commit hash for the commit with message "Update info.txt"
COMMIT_HASH=$(sudo git log feature --grep="Update info.txt" -1 --format="%H")
# Cherry-pick the commit from feature branch to master branch
# Cherry-pick will apply the changes introduced by the specified commit onto the current branch
sudo git cherry-pick $COMMIT_HASH
# Push the changes to the remote master branch
sudo git push origin master