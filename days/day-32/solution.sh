#!/usr/bin/env bash
# Day 32 - Rebase feature branch with master in the official repository.

set -euo pipefail

# Run on Storage Server:
# ssh natasha@ststor01

cd /usr/src/kodekloudrepos/official

# KodeKloud repos sometimes trigger "dubious ownership" depending on user/sudo history.
sudo git config --global --add safe.directory /usr/src/kodekloudrepos/official || true

sudo git status
sudo git branch -a
sudo git remote -v

sudo git checkout master
sudo git pull --ff-only origin master

sudo git checkout feature
sudo git rebase master

# If conflicts appear:
#   sudo git status
#   edit conflicted files
#   sudo git add <resolved-file>
#   sudo git rebase --continue

sudo git push --force-with-lease origin feature

sudo git status
sudo git branch --show-current
sudo git merge-base --is-ancestor master feature && echo "feature contains master"
sudo git log --oneline --decorate --graph --all -n 12
