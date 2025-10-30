# Docker/Kubernetes Solutions

## Question 1: Docker Compose for Nginx with persistent logs and custom network

See: `docker-compose/docker-compose.yml`

## Question 2: Kubernetes command to identify pod restart reason

**Answer:**
```bash
kubectl describe pod <pod-name> -n production
```

## Question 3: Java-app pod restart analysis

See: `pod-restart-analysis.md` for detailed analysis

**Summary:** Pod restarts due to memory issues. Usage 1142Mi exceeds request 1000Mi, and Java Xmx=1000M leaves no room for container overhead.
