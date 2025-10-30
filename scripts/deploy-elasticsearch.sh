#!/bin/bash
cd ../03-helm/elasticsearch
helm install customer-abc-elasticsearch . -f envs/qa/customer-abc-elasticsearch/values.yaml -n default
kubectl wait --for=condition=ready pod -l app=customer-abc-elasticsearch -n default --timeout=300s || true
kubectl get pods,svc,statefulset -n default
