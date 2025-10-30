# WallStreetDocs DevOps Challenge

This repository contains solutions to the WallStreetDocs DevOps Engineer case study.

## Project Structure

```
nisha-devops-WSD-challenge/
├── 01-configuration-management/  # Ansible solutions
├── 02-docker-kubernetes/          # Docker & K8s solutions
├── 03-helm/                        # Elasticsearch Helm chart
├── 04-metrics/                     # Prometheus solutions
├── 05-databases/                   # Cassandra & MongoDB solutions
├── scripts/                        # Helper scripts
└── README.md
```

## Quick Start

### 1. Setup Environment (WSL Ubuntu 20.04)
```bash
bash scripts/setup-environment.sh
```

### 2. Test Docker Compose
```bash
cd 02-docker-kubernetes/docker-compose
docker-compose up -d
```

### 3. Deploy Elasticsearch with Helm
```bash
cd 03-helm
minikube start --driver=docker --memory=4096 --cpus=2
bash scripts/deploy-elasticsearch.sh
```

## Solutions Summary

### Configuration Management
- Q1: `ansible hostname -m setup`
- Q2: Cron job configured via Ansible
- Q3: ntpd deployment with Nagios monitoring

### Docker/Kubernetes
- Q1: Docker Compose with persistent volumes
- Q2: `kubectl describe pod <pod-name> -n production`
- Q3: Pod restart due to memory issues (detailed analysis included)

### Helm
- Elasticsearch StatefulSet deployment with 3 replicas
- Includes all required templates and configurations

### Metrics
- Q1: Prometheus architecture explained
- Q2: Custom alert rules for K8s monitoring
- Q3: Use `rate(metric_name[5m])` for counter metrics

### Databases
- Cassandra: Use QUORUM consistency + regular repairs
- MongoDB: Sharding steps for collection migration

## Author
Nisha - DevOps Engineer Candidate
