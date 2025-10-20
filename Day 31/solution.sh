# The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/cluster present on Storage server in Stratos DC. One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes. Find below more details to accomplish this task:



# Look for the stashed changes under /usr/src/kodekloudrepos/cluster git repository, and restore the stash with stash@{1} identifier. Further, commit and push your changes to the origin.
cd /usr/src/kodekloudrepos/cluster
sudo git checkout master
sudo git pull origin master
# Restore the stashed changes
sudo git stash apply stash@{1}
# Stage the changes
sudo git add .
# Commit the changes
sudo git commit -m "Restored stashed changes"
# Push the changes to the remote repository
sudo git push origin master