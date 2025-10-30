# Helm Elasticsearch Deployment

## Deployment Steps

1. Start Minikube:
```bash
minikube start --driver=docker --memory=4096 --cpus=2
```

2. Deploy:
```bash
#cd elasticsearch
cd ~/nisha-devops-WSD-challenge/03-helm/elasticsearch
helm install customer-abc-elasticsearch . -f envs/qa/customer-abc-elasticsearch/values.yaml -n default
```
<img width="936" height="230" alt="image" src="https://github.com/user-attachments/assets/52c32fbe-e49f-495b-8b4d-503abb50329f" />



3. Verify:
```bash
kubectl get pods,svc,statefulset -n default
```
<img width="940" height="310" alt="image" src="https://github.com/user-attachments/assets/54851699-2c1e-41cd-99ae-7a2ef6ae3602" />
