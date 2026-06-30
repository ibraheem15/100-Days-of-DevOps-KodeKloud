# AGENTS.MD

This file provides guidance to agents when working in this repository.

# 100 Days of DevOps - KodeKloud

A hands-on, day-by-day learning roadmap covering practical DevOps through KodeKloud Engineer-style tasks.

## Structure

- 100 days, grouped by DevOps domains.
- Each day is a focused, practical operations task.
- Progressive: later days should build on earlier habits and tooling.
- No repo-wide build/test/lint. Each day is self-contained.
- Existing imported work may live in `Day N/`, but new tasks should use `days/day-XX/`.

## Repo layout

- [`days/`](days/) - one directory per day, with the lab README, walkthrough, solution script, and reference files.
- [`notes/`](notes/) - cross-cutting DevOps concepts such as Linux permissions, systemd, firewalls, Git workflows, containers, Kubernetes objects, CI/CD, and troubleshooting patterns.
- [`projects/`](projects/) - real-world use cases built alongside the daily labs; longer-arc work that synthesizes multiple days into something that does a thing.
- [`BACKLOG.md`](BACKLOG.md) - outstanding work tracked at the repo root.

## Current domains

- Linux users, security, permissions, cron, SSH
- Web, app, firewall, and database services
- Git and release operations
- Containers and Docker
- Jenkins and CI/CD
- Ansible automation
- Terraform and infrastructure as code
- Kubernetes fundamentals
- Monitoring, logging, and reliability
- Security, GitOps, and capstone work

## Git

Do not commit yourself. Only the user commits. After a task passes, summarize what changed and what should be captured in the README or solution script before any commit discussion.

## Conventions

- Each new day gets its own directory: `days/day-XX/`
- The day explanation goes in `days/day-XX/README.md`
- The narrative lab record goes in `days/day-XX/walkthrough.md`
- The command path goes in `days/day-XX/solution.sh`
- Reference configs, manifests, scripts, and service files go in `days/day-XX/references/`
- Cross-cutting explanations go in `notes/`
- Multi-day applied builds go in `projects/`
- Outstanding cleanup, migrations, and follow-ups go in `BACKLOG.md`
- Keep it practical: runnable commands and verifiable checks over theory.
- When a day depends on earlier work, reference it explicitly instead of copying large chunks.
- Mark progress in the root `README.md` when a day's acceptance criteria are met.

## KodeKloud daily lab mode

The user can run one KodeKloud task per day. Use that real platform task as the source of truth instead of building a local mock lab by default.

When the user provides a KodeKloud-style problem statement:

1. Focus first on helping the user pass the real KodeKloud task.
2. Ask for the exact task statement, target host, files, command output, or screenshots only when needed.
3. Guide one diagnostic or fix step at a time during the timed lab.
4. Do not create a full local mimic unless the user explicitly asks for one.
5. After the platform grader passes, add or improve durable repo artifacts under `days/day-XX/`: README, walkthrough, solution script, reference snippets, and gotchas.
6. Explain the solution after pass, line by line when useful, to teach the production-style version of the lab.

In this mode, the repo is mainly the learning record and solution library. The real task runs on KodeKloud; the local workspace captures what worked and why.

## Teaching style: pass the task fast, learn deeply after

Hard constraint: lab tasks are timed. During the task, optimize for passing, not for long explanations. Save deeper explanation for after the grader is green.

Artifact timing:

| Artifact | When |
|---|---|
| `days/day-XX/README.md` | Created or improved when the task details are known. |
| `days/day-XX/walkthrough.md` | Built during or immediately after the lab from the actual fix path and real checks. |
| `days/day-XX/solution.sh` | Built during or immediately after the lab from the reusable command path. |
| Root `README.md` progress | Updated after the task is complete. |
| `notes/<topic>.md` | Created when a concept is reusable across days. |
| `BACKLOG.md` | Updated when cleanup or migration work should not interrupt the timed lab. |

Three-phase workflow:

### Phase 1: lab start

- Read the exact task statement.
- Identify the host, service, path, port, package, user, group, database, branch, or repository.
- Ask for missing details if the task is ambiguous.
- Capture the starting state with focused checks:
  - `systemctl status`
  - `ss -tulpn`
  - `curl`
  - `ls -l`
  - `id`
  - `getent`
  - `crontab -l`
  - `git status`
  - `git log --oneline`
  - database client commands

### Phase 2: lab in progress

- In chat, walk through one diagnostic or fix step at a time.
- Keep commands direct and explain only enough to avoid mistakes.
- Prefer exact service checks and target-path checks over broad guesses.
- Before declaring done, cross-check every acceptance criterion.
- Tool silence is not enough. The grader may check exact paths, ports, users, ownership, branches, or persisted service state.

### Phase 3: after grader green

1. Pause and acknowledge the pass.
2. Capture the final command path in `days/day-XX/solution.sh`.
3. Improve `days/day-XX/README.md` with the task, why it matters, verification, gotchas, and automation ideas.
4. Add or update `days/day-XX/walkthrough.md` with the actual lab path, outputs, surprises, and checks.
5. Promote reusable concepts to `notes/` when they are bigger than one day.
6. Update the root `README.md` checkbox or add the next day entry.
7. Do not commit unless the user explicitly asks.

## Per-day README structure

Every new `days/day-XX/README.md` should include these sections, in order:

1. **Task** - what is being changed, including acceptance criteria.
2. **Why this matters** - the production problem this skill solves.
3. **Use case** - a concrete real-world scenario where this appears.
4. **Starting checks** - commands used to inspect the current state.
5. **Steps** - the fix path in execution order.
6. **Verification** - commands that prove the result.
7. **Gotchas worth remembering** - exact-name issues, host mistakes, path mistakes, service reloads, permissions, persistence, or grader strictness.
8. **Automation ideas** - how the task could become a script, Ansible playbook, Terraform change, Jenkins step, or Kubernetes manifest.
9. **What this day proves for the rest of the course** - how the task supports later domains.
10. **Resources** - official docs or high-signal references when useful.

Write explanatory sections in plain language. Prefer concrete examples over abstract claims.

## Per-day walkthrough structure

Every `days/day-XX/walkthrough.md` should include:

- the starting state or planted broken state;
- the actual fix path, including commands or GUI actions used;
- meaningful outputs, failures, surprises, or checks;
- an **After Green - Reusable Solution** section when a polished script or reference artifact is added;
- **Gotchas worth remembering**;
- **What this day proves for the rest of the course**.

Walkthroughs can be longer and more narrative than READMEs. The README is the quick reference; the walkthrough is the learning record.

## Solution script structure

Every `days/day-XX/solution.sh` should include:

- a short comment naming the task;
- target host or role when relevant;
- commands in execution order;
- comments for required manual edits;
- verification commands at the end.

Avoid putting private keys, personal credentials, or unnecessary lab passwords in the repo.

## DevOps task patterns

Use these checks before changing common systems:

- Linux users: `id`, `getent passwd`, `chage -l`, `/etc/passwd`
- SSH: `/etc/ssh/sshd_config`, `sshd -t`, `systemctl restart sshd`
- Permissions: `ls -l`, `stat`, `chmod`, `chown`
- Cron: `systemctl status crond`, `crontab -l`, `/var/log/cron`
- Firewalls: `iptables -L -n --line-numbers`, `firewall-cmd --list-all`, `ss -tulpn`
- Apache/Nginx: config test, service restart, `curl localhost:<port>`
- Databases: service status, local client login, user and database listing
- Git: `git status`, `git branch -a`, `git log --oneline`, `git remote -v`
- Docker: `docker ps`, `docker logs`, `docker inspect`, `docker network ls`
- Kubernetes: `kubectl get`, `kubectl describe`, `kubectl logs`, `kubectl events`

## Destructive operations

Be careful with commands that rewrite state:

- `git reset --hard`
- `git push --force`
- deleting files or directories
- disabling security controls
- opening firewall access broadly
- dropping databases or users

Explain the impact before recommending them, and only run destructive local commands when the user explicitly asked or approved.

## Do not rush to commit

After a task passes, do not auto-commit. The discussion of what happened, what was learned, and what should be captured is part of the learning process.

Flow:

1. Task passes.
2. Pause.
3. Summarize the fix and verification.
4. Update README or solution files as needed.
5. Commit only when the user explicitly says to commit.
