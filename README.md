# Tryout ArgoCD with Sample Application

## Prerequisites

- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)
- [ArgoCD](https://argoproj.github.io/argo-cd/)
- Minikube (Optional) / Or any other cluster management service (AWS, GCP, Azure, etc.)

## Steps

1. Configure ArgoCD in your cluster

```
# install ArgoCD in k8s
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# access ArgoCD UI
kubectl get svc -n argocd
kubectl port-forward svc/argocd-server 8080:443 -n argocd
```

2. Open ArgoCD UI in your browser. Default username is `admin`. For the password execute following command

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo

# OR

kubectl get secret argocd-initial-admin-secret -n argocd -o yaml
echo <PasswordFromAboveCommand> | base64 --decode
```

3. Create a new application in ArgoCD

- This is the only time you need to run the `kubectl apply` command to initialize the application in ArgoCD

```
kubectl apply -f application.yaml
```
