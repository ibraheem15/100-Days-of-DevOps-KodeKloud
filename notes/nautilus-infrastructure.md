# Nautilus Infrastructure

Lab-only KodeKloud Nautilus server details. These credentials are part of the public practice environment and should not be reused outside the lab.

## Contents

- [Project overview](#project-overview)
- [Architecture](#architecture)
- [Server inventory](#server-inventory)
- [Common access pattern](#common-access-pattern)
- [Common repository paths](#common-repository-paths)

## Project overview

Project Nautilus is run by the Naval subdivision within xFusionCorp Industries. The Nautilus application supports procurement decisions for manned and unmanned maritime systems.

Current repertoire:

- Sonar Technology and Systems
- LUSV - Large Unmanned Surface Vehicles
- Autonomous Unmanned Undersea Pods
- Nuclear Submarines
- Laser Guidance Systems

## Architecture

Nautilus is a three-tier application deployed in the Stratos Datacenter in the North America region.

- Data tier: MariaDB.
- Application tier: LAMP stack with Linux, Apache HTTP Server, MariaDB/MySQL-compatible access, and PHP.
- Client tier: browser clients using HTTP.
- Load balancer: Nginx distributes HTTP requests across application servers.

Shared services:

- Storage Filer: NAS-style external storage for application tier servers.
- SFTP Server: SSH File Transfer Protocol for moving data between systems.
- Backup Server: short-term archival staging.
- Jump Server: SSH gateway to the remote environment.

## Server inventory

| Server | Hostname | User | Password | Purpose |
|---|---|---|---|---|
| Application Server 1 | `stapp01` | `tony` | `Ir0nM@n` | Hosts Nautilus Application 1 |
| Application Server 2 | `stapp02` | `steve` | `Am3ric@` | Hosts Nautilus Application 2 |
| Application Server 3 | `stapp03` | `banner` | `BigGr33n` | Hosts Nautilus Application 3 |
| Load Balancer Server | `stlb01` | `loki` | `Mischi3f` | Distributes Nautilus HTTP traffic |
| Database Server | `stdb01` | `peter` | `Sp!dy` | Hosts Nautilus database |
| Storage Server | `ststor01` | `natasha` | `Bl@kW` | Stores data for Nautilus servers |
| Backup Server | `stbkp01` | `clint` | `H@wk3y3` | Manages backups for Nautilus servers |
| Mail Server | `stmail01` | `groot` | `Gr00T123` | Manages email services |
| Jump Host Server | `jump-host` | `thor` | `mjolnir123` | Provides secure access to Stratos DC |
| Jenkins Server | `jenkins` | `jenkins` | `j@rv!s` | Runs Jenkins for CI/CD |

IP addresses are dynamic in KodeKloud labs. Prefer hostnames from the jump host when available.

## Common access pattern

Start from the jump host, then SSH to the target server:

```bash
ssh <user>@<hostname>
```

Examples:

```bash
ssh natasha@ststor01
ssh tony@stapp01
ssh peter@stdb01
```

## Common repository paths

Git tasks commonly use:

```text
/opt/<repo>.git
/usr/src/kodekloudrepos/<repo>
```

For Day 32:

```text
/opt/official.git
/usr/src/kodekloudrepos/official
```
