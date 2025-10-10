# Create a new branch xfusion in /usr/src/kodekloudrepos/blog repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.

cd /usr/src/kodekloudrepos/blog

git checkout master
# fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/blog'
sudo git config --global --add safe.directory /usr/src/kodekloudrepos/blog
sudo git pull origin master
sudo git checkout -b xfusion
sudo cp /tmp/index.html .
sudo git add index.html
sudo git commit -m "Added index.html file"
sudo git checkout master
sudo git merge xfusion
sudo git push origin master
sudo git push origin xfusion

