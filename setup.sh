#!/bin/sh

# Setup and configure ArgoCD
minikube start
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Apply initial application configurations
# kubectl apply -f application.yaml