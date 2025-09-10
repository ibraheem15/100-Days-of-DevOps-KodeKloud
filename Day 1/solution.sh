#!/bin/bash

# SSH into the server with username and password from 
# https://kodekloudhub.github.io/kodekloud-engineer/docs/projects/nautilus#infrastructure-details
# App server 2 means stapp02

ssh <username>@<ip_address>
# Password: <password>

# solution
sudo useradd -s /sbin/nologin <username>
