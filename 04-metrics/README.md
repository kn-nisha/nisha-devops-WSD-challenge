# Metrics - Prometheus Solutions

## Question 1: How Prometheus Works
Prometheus pulls metrics from targets via HTTP scraping, stores in time-series database, evaluates alerts, and provides PromQL for querying.

## Question 2: Custom Prometheus Alerts
See: `prometheus-alerts.yaml`

## Question 3: Prometheus Query for Counter Metrics
```promql
rate(metric_name[5m])
```
Always use `rate()` for counters as they only increase. This calculates per-second rate of increase.
