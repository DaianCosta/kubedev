
kubectl apply -f ./namespace-traefik.yaml -f ./namespace-dev.yaml 

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml

helm repo add traefik https://helm.traefik.io/traefik

helm repo update

helm install traefik traefik/traefik --namespace=traefik-hub

Traefik % kubectl apply -f . -R