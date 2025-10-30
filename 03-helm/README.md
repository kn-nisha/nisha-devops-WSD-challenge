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
<img width="943" height="230" alt="image" src="https://github.com/user-attachments/assets/259f128f-b441-4a76-b4c0-ccadf37d508a" />
<br><br> <!-- adds extra vertical gap -->

3. Verify:
```bash
kubectl get pods,svc,statefulset -n default
```
<img width="943" height="323" alt="image" src="https://github.com/user-attachments/assets/0588a85b-b197-4fec-9969-eef4b183669d" />
