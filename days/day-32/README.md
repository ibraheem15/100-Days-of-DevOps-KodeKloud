# Day 32 - Rebase Feature Branch with Master

## Task

The Nautilus application development team has a project repository at `/opt/official.git`. The repository is cloned on the Storage Server under `/usr/src/kodekloudrepos`.

The developer is working on the `feature` branch. Their work is still in progress, but new changes have been pushed to `master`. Rebase `feature` with `master` without losing any data from `feature`, and do not create a merge commit. Push the updated `feature` branch when done.

Acceptance criteria:

- Work on the Storage Server.
- Use the cloned `official` repository under `/usr/src/kodekloudrepos`.
- Update local `master` from origin.
- Rebase `feature` on top of `master`.
- Preserve feature branch changes.
- Do not create a merge commit.
- Push the rebased `feature` branch.

## Why this matters

Rebasing keeps a feature branch current with `master` while preserving a linear history. This is useful when a team wants clean commit history and does not want extra merge commits from regularly syncing a long-running branch.

The tradeoff is that rebase rewrites branch history. If the branch already exists on the remote, the push often needs `--force-with-lease` so Git can update the remote branch without blindly overwriting someone else's newer work.

## Use case

A developer has a feature branch in progress. Meanwhile, other changes land in `master`. Before opening a pull request or continuing development, the developer wants their branch replayed on top of the latest `master` so conflicts are handled early and the final history stays clean.

## Starting checks

```bash
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/official

sudo git status
sudo git branch -a
sudo git remote -v
sudo git log --oneline --decorate --graph --all -n 10
```

If Git reports dubious ownership in the KodeKloud lab, mark the repository safe:

```bash
sudo git config --global --add safe.directory /usr/src/kodekloudrepos/official
```

## Steps

```bash
cd /usr/src/kodekloudrepos/official

sudo git checkout master
sudo git pull --ff-only origin master

sudo git checkout feature
sudo git rebase master
```

If conflicts appear, resolve them file by file:

```bash
sudo git status
# edit conflicted files and preserve the required feature work
sudo git add <resolved-file>
sudo git rebase --continue
```

After the rebase completes, push the rewritten feature branch:

```bash
sudo git push --force-with-lease origin feature
```

## Verification

```bash
sudo git status
sudo git branch --show-current
sudo git merge-base --is-ancestor master feature && echo "feature contains master"
sudo git log --oneline --decorate --graph --all -n 12
```

Expected checks:

- Current branch is `feature`.
- Working tree is clean.
- `feature` contains the latest `master`.
- The graph does not show a new merge commit from merging `master` into `feature`.

## Gotchas worth remembering

- Do not run `git merge master`; the task explicitly says no merge commit.
- Rebase from the `feature` branch, not from `master`.
- Pull `master` first so the rebase uses the latest remote changes.
- Use `--force-with-lease` instead of plain `--force` when pushing a rebased branch.
- If the cloned path is not obvious, list `/usr/src/kodekloudrepos` and find the `official` repo.
- KodeKloud repos under `/usr/src/kodekloudrepos` often need `sudo git`. If the repo is writable by your current user, plain `git` is fine.

## Automation ideas

- A small Git sync helper could fetch all remotes, verify the current branch, rebase from a named base branch, and print the push command.
- A pre-push check could reject merge commits on feature branches when the team requires linear history.
- CI could verify that a feature branch contains the current `master` before allowing review.

## What this day proves for the rest of the course

This day reinforces Git history control. Later CI/CD, GitOps, and deployment workflows depend on clean branch state, predictable history, and careful handling of destructive operations such as rewritten branch history.

## Resources

- `git help rebase`
- `git help push`
- `git help merge-base`
- [Nautilus infrastructure note](../../notes/nautilus-infrastructure.md)
