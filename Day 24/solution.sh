# On Storage server in Stratos DC create a new branch xfusioncorp_official from master branch in /usr/src/kodekloudrepos/official git repo.
cd /usr/src/kodekloudrepos/official
git checkout master
# fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/blog'
sudo git config --global --add safe.directory /usr/src/kodekloudrepos/official
sudo git pull origin master
sudo git checkout -b xfusioncorp_official
sudo git push origin xfusioncorp_official
