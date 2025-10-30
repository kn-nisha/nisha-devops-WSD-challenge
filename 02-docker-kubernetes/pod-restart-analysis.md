# Java-App Pod Restart Analysis

## Current Resource Usage
- **Total Memory:** 1142Mi (java-app: 951Mi + logrotate: 45Mi + fluentd: 84Mi + mongos: 62Mi)
- **Total CPU:** 9m
- **Memory Request/Limit:** 1000Mi / 1500Mi
- **CPU Request/Limit:** 1000m / 2000m
- **Java Xmx:** 1000M

## Root Causes for Random Restarts

### 1. Memory Request Exceeded
Pod uses 1142Mi but requests only 1000Mi (142Mi over). During node memory pressure, this pod is first to be evicted.

### 2. Java Heap Misconfiguration
Xmx=1000M with 1500Mi limit is too high. Java doesn't account for container overhead (other containers + OS).

### 3. OOMKilled Risk
Memory usage at 1142Mi / 1500Mi limit = 76%. Any spike will trigger OOMKill.
