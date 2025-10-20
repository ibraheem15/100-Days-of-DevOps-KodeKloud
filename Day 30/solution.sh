# The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/demo present on Storage server in Stratos DC. This was just a test repository and one of the developers just pushed a couple of changes for testing, but now they want to clean this repository along with the commit history/work tree, so they want to point back the HEAD and the branch itself to a commit with message add data.txt file. Find below more details:



# In /usr/src/kodekloudrepos/demo git repository, reset the git commit history so that there are only two commits in the commit history i.e initial commit and add data.txt file.
# Also make sure to push your changes.


cd /usr/src/kodekloudrepos/demo
sudo git checkout master
sudo git pull origin master
# Find the commit hash for the commit with message "add data.txt file"
COMMIT_HASH=$(sudo git log --grep="add data.txt file" -1 --format="%H")
# Reset the branch to the specified commit hash, using --hard to reset the working
# directory and staging area to match the commit
sudo git reset --hard $COMMIT_HASH
# Push the changes to the remote repository, using --force to overwrite the remote history
sudo git push origin master --force