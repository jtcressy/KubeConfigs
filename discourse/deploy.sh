#! /bin/bash
kubectl apply -f pvc.yaml
echo "Wait 10s for volume claims..."
sleep 10
echo "Done."
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml