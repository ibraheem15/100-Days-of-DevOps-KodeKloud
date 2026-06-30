# Day 32 Walkthrough - Rebase Feature Branch with Master

## Starting state

The task is performed on the Storage Server for the Nautilus project. The bare repository is `/opt/official.git`, and the working clone is expected under:

```bash
/usr/src/kodekloudrepos/official
```

The important branches are:

- `master` - has newer pushed changes.
- `feature` - contains in-progress developer work.

The requirement is to update `feature` with `master` without creating a merge commit and without losing feature work.

## Fix path

Connect to the Storage Server:

```bash
ssh natasha@ststor01
```

Move into the clone:

```bash
cd /usr/src/kodekloudrepos/official
```

If the exact directory differs, inspect the parent directory:

```bash
ls -la /usr/src/kodekloudrepos
```

Inspect the repo before changing it:

```bash
sudo git status
sudo git branch -a
sudo git remote -v
sudo git log --oneline --decorate --graph --all -n 10
```

Update local `master`:

```bash
sudo git checkout master
sudo git pull --ff-only origin master
```

Rebase `feature` on top of the updated `master`:

```bash
sudo git checkout feature
sudo git rebase master
```

If Git reports conflicts, check which files need attention:

```bash
sudo git status
```

Resolve the conflict markers in each file, then continue:

```bash
sudo git add <resolved-file>
sudo git rebase --continue
```

Repeat until the rebase completes.

Push the rebased branch:

```bash
sudo git push --force-with-lease origin feature
```

## Verification

Run:

```bash
sudo git status
sudo git branch --show-current
sudo git merge-base --is-ancestor master feature && echo "feature contains master"
sudo git log --oneline --decorate --graph --all -n 12
```

The expected final state:

- `feature` is checked out.
- The working tree is clean.
- `feature` contains `master`.
- No new merge commit was created.
- Remote `origin/feature` has the rebased branch.

## After Green - Reusable Solution

The reusable command path is captured in [`solution.sh`](solution.sh).

The Nautilus server credentials and host map are captured once in the shared note:

```text
notes/nautilus-infrastructure.md
```

## Gotchas worth remembering

- `git rebase master` must be run while on `feature`.
- `git pull --ff-only origin master` avoids accidentally creating a local merge commit on `master`.
- A rebased branch usually needs a force-style push because the commit IDs changed.
- `--force-with-lease` is safer than `--force` because it refuses to overwrite newer remote work you have not seen.
- Conflict resolution should preserve both the latest `master` changes and the developer's feature work.
- Use `sudo git` in this lab if `/usr/src/kodekloudrepos/official` is not writable by the current user.

## What this day proves for the rest of the course

Clean Git history matters for CI/CD and GitOps. A deployment pipeline is easier to reason about when branch history is linear, current, and intentionally rewritten only when the team expects it.
