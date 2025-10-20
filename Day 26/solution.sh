# The xFusionCorp development team added updates to the project that is maintained under /opt/blog.git repo and cloned under /usr/src/kodekloudrepos/blog. Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, so we need to update remote on /usr/src/kodekloudrepos/blog repository as per details mentioned below:


# a. In /usr/src/kodekloudrepos/blog repo add a new remote dev_blog and point it to /opt/xfusioncorp_blog.git repository.
cd /usr/src/kodekloudrepos/blog
sudo git remote add dev_blog /opt/xfusioncorp_blog.git

# b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.
sudo git checkout master
sudo git pull origin master
sudo cp /tmp/index.html .
sudo git add index.html
sudo git commit -m "Added index.html file"

# c. Finally push master branch to this new remote origin.
sudo git push dev_blog master