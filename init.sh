#!/bin/bash

kubectl delete deployments --all -n default

# Check if the secret exists
SECRET_NAME="mes-system-secrets"
SECRET_DATA_FILE=".secret"
kubectl get secret "$SECRET_NAME" >/dev/null 2>&1
if [ $? -eq 0 ]; then
  kubectl delete secret "$SECRET_NAME"
fi
kubectl create secret generic "$SECRET_NAME" --from-env-file="$SECRET_DATA_FILE"

# Check if the config map exists
CONFIG_MAP_NAME="mes-system-env"
CONFIG_MAP_DATA_FILE=".config"
kubectl get configmap "$CONFIG_MAP_NAME" >/dev/null 2>&1
if [ $? -eq 0 ]; then
  kubectl delete configmap "$CONFIG_MAP_NAME"
fi
kubectl create configmap "$CONFIG_MAP_NAME" --from-env-file="$CONFIG_MAP_DATA_FILE"

# Set up the "mes-poc-api-gateway" component.
if ! [ -d "mes-poc-api-gateway" ]; then
  git clone git@github.com:ping-douglasl/mes-poc-api-gateway.gitX
fi
./mes-poc-api-gateway/build.sh
./mes-poc-api-gateway/deploy.sh

# Set up the "mes-poc-database" component.
if ! [ -d "mes-poc-database" ]; then
  git clone git@github.com:ping-douglasl/mes-poc-database.git
fi
./mes-poc-database/build.sh
./mes-poc-database/deploy.sh

# Set up the "mes-poc-dotnet-app" component.
if ! [ -d "mes-poc-dotnet-app" ]; then
  git clone git@github.com:ping-douglasl/mes-poc-dotnet-app.gitX
fi
./mes-poc-dotnet-app/build.sh
./mes-poc-dotnet-app/deploy.sh