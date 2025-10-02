# PostgreSQL: create a database user and a database
sudo -i -u postgres psql <<EOF
CREATE USER kodekloud_roy WITH PASSWORD 'dCV3szSGNA';
CREATE DATABASE kodekloud_db1 OWNER kodekloud_roy;
EOF
# -i is used to switch to the postgres user
# -u specifies the user to switch to (postgres)
# -psql is the PostgreSQL interactive terminal
# -<<EOF allows you to run multiple commands in a single psql session

# Grant all privileges on the database to the user
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE kodekloud_db1 TO kodekloud_roy;"
# -c allows you to run a single command and exit

# Verify the user and database creation
sudo -i -u postgres psql -c "\du"
sudo -i -u postgres psql -c "\l"
