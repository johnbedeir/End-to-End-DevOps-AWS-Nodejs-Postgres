# #/bin/bash

CLUSTER_NAME=cluster-1-test
NAMESPACE=default
REGION=eu-central-1
RELEASE_NAME=my-argo-cd

#Update kubeconfig
echo "--------------------Update kubeconfig--------------------"
aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${REGION}

#Deploy ArgoCD on EKS
echo "--------------------Deploy ArgoCD on EKS--------------------"
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install ${RELEASE_NAME} argo/argo-cd

#Sleep 1 miniute
echo "--------------------Wait for the pods to start--------------------"
sleep 1m

#Change to LoadBalancer
echo "--------------------Change Argocd Service to LoadBalancer--------------------"
kubectl patch svc ${RELEASE_NAME}-argocd-server -n ${NAMESPACE} -p '{"spec": {"type": "LoadBalancer"}}'

#Sleep 10 seconds
echo "--------------------Creating External-IP--------------------"
sleep 10s

#Reveal Argocd URL
echo "--------------------Argocd Ex-URL--------------------"
kubectl get service ${RELEASE_NAME}-argocd-server -n ${NAMESPACE} | awk '{print $4}'

#Reveal ArgoCD Pass
echo "--------------------ArgoCD UI Password--------------------"
echo "Username: admin"
kubectl -n ${NAMESPACE} get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > argo-pass.txt