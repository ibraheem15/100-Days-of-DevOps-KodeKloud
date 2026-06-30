# 100-Days-of-DevOps-KodeKloud

A structured, hands-on roadmap for learning DevOps through KodeKloud Engineer-style tasks. One real operations problem per day, grouped into domains, building from Linux fundamentals toward production-style infrastructure, automation, CI/CD, Kubernetes, monitoring, and capstone deployments.

The goal is not to collect random commands. Each day should teach the operational habit behind the task: inspect first, make the smallest correct change, verify like a grader or production check would verify, then record the durable solution.

## Repo layout

- [`days/`](days/) - one directory per day, with the lab README, walkthrough, solution script, and reference files.
- [`notes/`](notes/) - cross-cutting DevOps concepts such as Linux permissions, systemd, firewalls, Git workflows, containers, Kubernetes objects, CI/CD, and troubleshooting patterns.
- [`projects/`](projects/) - real-world use cases built alongside the daily labs; longer-arc work that synthesizes multiple days into something that does a thing. See [`projects/README.md`](projects/README.md).
- [`BACKLOG.md`](BACKLOG.md) - outstanding work tracked at the repo root.
- [`AGENTS.MD`](AGENTS.MD) - working instructions for agents helping in this repo.

Existing imported work currently lives in `Day 1/`, `Day 2/`, etc. Keep those directories unless intentionally migrating them, but design new tasks under `days/day-XX/`.

## Working style for every next task

Each new task should be designed like a small production incident or change request:

1. Start from the real KodeKloud task statement.
2. Identify the target host, service, path, port, user, package, database, branch, or repository.
3. Capture the starting state with focused checks before changing anything.
4. Apply the smallest correct fix.
5. Restart, reload, or persist configuration only when the task requires it.
6. Verify the result with direct commands such as `systemctl status`, `ss`, `curl`, `ls -l`, `id`, `crontab -l`, `git log`, `git status`, or a database client.
7. Save the final command path in `days/day-XX/solution.sh`.
8. Write or improve the day README so the lesson is reusable after the lab timer is gone.

During the live lab, passing the grader comes first. After the grader is green, slow down and capture what the task proved.

## Standard day design

Every new `days/day-XX/README.md` should use this shape unless the task clearly needs something different:

1. **Task** - the exact thing requested, including acceptance criteria.
2. **Why this matters** - the operational problem this skill solves.
3. **Use case** - a realistic situation where this task appears in production.
4. **Starting checks** - commands used to inspect the current state.
5. **Steps** - the fix path in order.
6. **Verification** - commands that prove the task is complete.
7. **Gotchas worth remembering** - host mistakes, path mistakes, port issues, permissions, service reloads, branch names, or grader strictness.
8. **Automation ideas** - how this could later become a script, Ansible task, Terraform change, Jenkins step, or Kubernetes manifest.
9. **What this day proves for the rest of the course** - how the skill supports later DevOps work.
10. **Resources** - official docs or high-signal references when useful.

`solution.sh` should stay lean: commands in execution order, comments only where they prevent mistakes, and verification at the end.

## Per-day artifact layout

New daily tasks should use this structure:

```text
days/
`-- day-XX/
    |-- README.md
    |-- walkthrough.md
    |-- solution.sh
    `-- references/
```

- `README.md` is the quick study sheet and durable explanation.
- `walkthrough.md` is the narrative of what happened during the lab, including mistakes, outputs, and checks.
- `solution.sh` is the reusable command path.
- `references/` holds config files, manifests, scripts, service files, or snippets worth preserving.

Use `notes/` when the lesson becomes bigger than one day. Use `projects/` when several days combine into a realistic deployment or operations workflow.

## Current progress

### Domain 1: Linux Users, Security, and Scheduling (Days 1-10)

- [x] **Day 1** - Linux user setup with a non-interactive shell
- [x] **Day 2** - Temporary user setup with account expiry
- [x] **Day 3** - Revoke root SSH access
- [x] **Day 4** - Give execution permission to everyone for a script
- [x] **Day 5** - Install SELinux and set it to disabled mode
- [x] **Day 6** - Install cronie and add a cron job
- [x] **Day 7** - Configure passwordless SSH
- [x] **Day 8** - Install Ansible for all users
- [x] **Day 9** - Fix a MariaDB service issue
- [x] **Day 10** - Automate a website backup

### Domain 2: Web, App, Firewall, and Database Services (Days 11-20)

- [x] **Day 11** - Deploy a Java application on Tomcat
- [x] **Day 12** - Fix Apache error state and expose it externally
- [x] **Day 13** - Configure iptables access rules for a service port
- [x] **Day 14** - Troubleshoot Apache across app servers
- [x] **Day 15** - Configure Nginx with SSL
- [x] **Day 16** - Configure Nginx load balancing
- [x] **Day 17** - Create a PostgreSQL user and database
- [x] **Day 18** - Configure Apache, PHP, and MariaDB for an app
- [x] **Day 19** - Restore multiple websites under Apache paths
- [x] **Day 20** - Configure Nginx with PHP-FPM over a Unix socket

### Domain 3: Git and Release Operations (Days 21-31)

- [x] **Day 21** - Install Git and create a bare repository
- [x] **Day 22** - Clone a repository from local server storage
- [ ] **Day 23** - Reserved for the next KodeKloud Git task
- [x] **Day 24** - Create and push a branch from master
- [x] **Day 25** - Branch, commit, merge, and push changes
- [x] **Day 26** - Add a Git remote and push to it
- [x] **Day 27** - Revert the latest Git commit
- [x] **Day 28** - Cherry-pick a commit into master
- [ ] **Day 29** - Reserved for the next KodeKloud Git task
- [x] **Day 30** - Reset Git history to a target commit
- [x] **Day 31** - Restore a selected Git stash

Progress: 29 / 31 recorded days complete

## Planned roadmap for future KodeKloud DevOps tasks

These are the intended domains for the next tasks. The exact day titles should come from the live KodeKloud task when possible.

### Domain 4: Containers and Docker (Days 32-40)

- [ ] **Day 32** - Install Docker and validate the daemon
- [ ] **Day 33** - Run and inspect containers
- [ ] **Day 34** - Build an image from a Dockerfile
- [ ] **Day 35** - Manage volumes and bind mounts
- [ ] **Day 36** - Configure container networking
- [ ] **Day 37** - Push and pull images from a registry
- [ ] **Day 38** - Troubleshoot a broken containerized service
- [ ] **Day 39** - Compose a multi-service stack
- [ ] **Day 40** - Containerize and run a web application

### Domain 5: Jenkins and CI/CD (Days 41-48)

- [ ] **Day 41** - Install and start Jenkins
- [ ] **Day 42** - Configure a Jenkins job
- [ ] **Day 43** - Build from a Git repository
- [ ] **Day 44** - Add credentials safely
- [ ] **Day 45** - Run shell build steps
- [ ] **Day 46** - Create a basic Jenkins pipeline
- [ ] **Day 47** - Publish or archive build artifacts
- [ ] **Day 48** - Troubleshoot a failed CI job

### Domain 6: Ansible Automation (Days 49-57)

- [ ] **Day 49** - Create an Ansible inventory
- [ ] **Day 50** - Run ad-hoc commands
- [ ] **Day 51** - Write a package and service playbook
- [ ] **Day 52** - Use variables and templates
- [ ] **Day 53** - Manage users and permissions
- [ ] **Day 54** - Configure web servers with Ansible
- [ ] **Day 55** - Use handlers for service reloads
- [ ] **Day 56** - Troubleshoot playbook failures
- [ ] **Day 57** - Convert a manual KodeKloud task into a playbook

### Domain 7: Terraform and Infrastructure as Code (Days 58-66)

- [ ] **Day 58** - Initialize a Terraform project
- [ ] **Day 59** - Write a provider and resource configuration
- [ ] **Day 60** - Use variables and outputs
- [ ] **Day 61** - Understand state and locking
- [ ] **Day 62** - Import or inspect existing infrastructure
- [ ] **Day 63** - Use modules for repeatable infrastructure
- [ ] **Day 64** - Plan and apply controlled changes
- [ ] **Day 65** - Troubleshoot Terraform drift
- [ ] **Day 66** - Document an infrastructure change request

### Domain 8: Kubernetes Fundamentals (Days 67-82)

- [ ] **Day 67** - Inspect a Kubernetes cluster
- [ ] **Day 68** - Create Pods and Deployments
- [ ] **Day 69** - Expose workloads with Services
- [ ] **Day 70** - Use ConfigMaps and Secrets
- [ ] **Day 71** - Configure probes and restarts
- [ ] **Day 72** - Manage labels and selectors
- [ ] **Day 73** - Scale Deployments
- [ ] **Day 74** - Roll out and roll back changes
- [ ] **Day 75** - Use namespaces and RBAC basics
- [ ] **Day 76** - Mount volumes
- [ ] **Day 77** - Troubleshoot failing Pods
- [ ] **Day 78** - Debug service connectivity
- [ ] **Day 79** - Work with Jobs and CronJobs
- [ ] **Day 80** - Package manifests for reuse
- [ ] **Day 81** - Deploy a multi-service app
- [ ] **Day 82** - Kubernetes troubleshooting review

### Domain 9: Monitoring, Logging, and Reliability (Days 83-91)

- [ ] **Day 83** - Check logs with service tools and `journalctl`
- [ ] **Day 84** - Add basic service health checks
- [ ] **Day 85** - Install or inspect Prometheus
- [ ] **Day 86** - Install or inspect Grafana
- [ ] **Day 87** - Configure an alerting rule
- [ ] **Day 88** - Troubleshoot disk, CPU, and memory pressure
- [ ] **Day 89** - Debug network connectivity
- [ ] **Day 90** - Write an incident-style walkthrough
- [ ] **Day 91** - Build a reliability checklist for app services

### Domain 10: Security, GitOps, and Capstone (Days 92-100)

- [ ] **Day 92** - Manage secrets safely
- [ ] **Day 93** - Harden SSH and service access
- [ ] **Day 94** - Apply least-privilege permissions
- [ ] **Day 95** - Use Git as the source of truth for config
- [ ] **Day 96** - Deploy with a GitOps-style workflow
- [ ] **Day 97** - Capstone: provision and configure services
- [ ] **Day 98** - Capstone: deploy an application
- [ ] **Day 99** - Capstone: add monitoring and rollback notes
- [ ] **Day 100** - Capstone: final production-style runbook

## Companion study resources

Use external KodeKloud courses and docs as supporting material, not as a replacement for the real lab:

- Linux basics and system administration
- Git for DevOps
- Docker training
- Jenkins pipelines
- Ansible basics
- Terraform basics
- Kubernetes for beginners
- CKA-style troubleshooting practice

## Notes for learners

Most KodeKloud misses are not caused by not knowing the tool. They are caused by tiny operational details: wrong host, wrong port, wrong service name, wrong branch, wrong file owner, missing persistence, or forgetting to verify from the same place the grader checks.

Treat each day as a rehearsal for real production work: understand the request, inspect the system, change only what is needed, prove it, and write down the lesson while it is still fresh.
