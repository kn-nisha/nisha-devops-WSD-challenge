# WallStreetDocs DevOps Challenge Solutions

Candidate: Kamrun Nahar Nisha  
Date & Time: October 31, 2025 – 4:00 AM BST
Corresponding CET: October 30, 2025 – 11:00 PM CET

## Overview

This repository contains my solutions for the WallStreetDocs DevOps Engineer case study. I've organized all solutions by topic for easy navigation.

## Repository Structure

```
nisha-devops-WSD-challenge/
├── 01-configuration-management/  
│   ├── ansible/                  # Ansible playbooks and inventory
│   │   ├── inventory.ini         # Server inventory file
│   │   ├── logrotate_cron.yml   # Question 2: Logrotate cron setup
│   │   ├── ntpd_deployment.yml  # Question 3: NTP deployment
│   │   └── templates/            # Jinja2 templates for configs
│   └── README.md                 # Question 1 answer and explanations
│
├── 02-docker-kubernetes/
│   ├── docker-compose/           # Question 1: Nginx docker-compose
│   │   ├── docker-compose.yml
│   │   ├── nginx.conf
│   │   └── html/
│   ├── pod-restart-analysis.md   # Question 3: Detailed analysis
│   └── README.md                 # Question 2 answer
│
├── 03-helm/
│   └── elasticsearch/            # Elasticsearch Helm deployment
│       ├── Chart.yaml
│       ├── templates/            # K8s manifests
│       └── envs/qa/              # Environment-specific values
│
├── 04-metrics/
│   ├── prometheus-alerts.yaml    # Question 2: Alert configurations
│   └── README.md                 # Questions 1 & 3 answers
│
└── 05-databases/
    ├── cassandra/
    │   └── consistency-issue.md  # Cassandra problem analysis
    └── mongodb/
        └── sharding-steps.md     # MongoDB sharding guide
```

## Solutions Summary

### 1. Configuration Management (Ansible)

**Question 1:** Which ansible command displays all ansible_ configuration for a host?
```bash
ansible hostname -m setup
```

**Question 2:** Configured cron job via Ansible playbook to run logrotate every 10 minutes between 2-4 AM.
- File: `01-configuration-management/ansible/logrotate_cron.yml`

**Question 3:** Deployed ntpd package to three servers with custom configuration and Nagios monitoring templates.
- File: `01-configuration-management/ansible/ntpd_deployment.yml`
- Includes: NTP config template and Nagios host/service definitions

### 2. Docker/Kubernetes

**Question 1:** Docker Compose for nginx with requirements met:
- Persistent logs using named volume
- Custom bridge network (172.20.8.0/24)
- File: `02-docker-kubernetes/docker-compose/docker-compose.yml`

**Question 2:** Command to identify pod restart reason:
```bash
kubectl describe pod <pod-name> -n production
```

**Question 3:** Java-app pod restart analysis
- Root cause: Memory configuration issues
- Current usage (1142Mi) exceeds request (1000Mi)
- Java Xmx=1000M doesn't account for sidecar containers
- Detailed analysis: `02-docker-kubernetes/pod-restart-analysis.md`

### 3. Helm

Deployed Elasticsearch StatefulSet with:
- 3 replicas
- Custom resource configurations
- Persistent volume claims (10Gi each)
- Monitoring exporters and log collectors
- Files: `03-helm/elasticsearch/`

### 4. Metrics (Prometheus)

**Question 1:** Prometheus works by:
- Scraping metrics from HTTP endpoints
- Storing time-series data in local TSDB
- Evaluating alert rules
- Providing PromQL for queries

**Question 2:** Created custom alert rules for Kubernetes monitoring including:
- Pod restart alerts
- Memory/CPU usage alerts
- OOMKilled detection
- Node pressure alerts
- File: `04-metrics/prometheus-alerts.yaml`

**Question 3:** For counter metrics in Grafana:
```promql
rate(metric_name[5m])
```
Reason: Counters always increase, so we need rate of change, not raw values.

### 5. Databases

**Cassandra Issue:**
- Problem: Inconsistent query results showing deleted data
- Root cause: Low consistency level (ONE) and missing repairs
- Solution: Use QUORUM consistency + regular nodetool repairs
- Details: `05-databases/cassandra/consistency-issue.md`

**MongoDB Sharding:**
- Task: Shard collection `sanfrancisco.company_name` based on `_id`
- Steps include: enabling sharding, adding replicaset_2, creating index, sharding collection
- Complete commands: `05-databases/mongodb/sharding-steps.md`

## Testing Environment

All solutions were tested in:
- **OS:** Ubuntu 20.04.6 LTS (WSL2)
- **Ansible:** 2.9.16
- **Docker:** 28.4.0
- **Docker Compose:** v2.24.0
- **Kubernetes:** Minikube v1.37.0
- **Helm:** v3.19.0

For database questions:
- Cassandra: Theoretical solution based on consistency principles
- MongoDB: Command-based solution for sharding setup

## How to Use This Repository

### Test Ansible Playbooks
```bash
cd ~/nisha-devops-WSD-challenge/01-configuration-management/ansible
ansible-playbook logrotate_cron.yml --syntax-check
ansible-playbook ntpd_deployment.yml --check
```

### Run Docker Compose
```bash
cd ~/nisha-devops-WSD-challenge/02-docker-kubernetes/docker-compose
docker-compose up -d
curl http://localhost
docker-compose exec nginx ls -l /var/log/nginx/
```

### Deploy Elasticsearch with Helm
```bash
minikube start --driver=docker --memory=4096 --cpus=2
cd ~/nisha-devops-WSD-challenge/03-helm/elasticsearch
helm install customer-abc-elasticsearch . \
  -f envs/qa/customer-abc-elasticsearch/values.yaml -n default
kubectl get pods,svc,statefulset -n default
```

## Notes

- Ansible playbooks are written for Ubuntu servers but tested with syntax validation only (since I don't have the access to actual servers)
- Helm deployment tested locally using Minikube with standard storage class
- Database solutions are based on best practices and official documentation

## Additional Resources

Each directory contains its own README with detailed explanations and step-by-step instructions.

---

If you have any questions about the solutions, please feel free to reach out.

**Nisha**  
DevOps Engineer Candidate
