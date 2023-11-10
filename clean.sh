# Shut down any Docker containers running for this project, remove their images and delete their volumes
docker-compose down --rmi --volumes

# Shut down any Kubernetes pods that are running
kubectl --namespace default scale deployment $(kubectl --namespace default get deployment | awk '{print $1}') --replicas 0 
kubectl delete all --all --namespace default

# Clean the API project
rm -rf ./mes-poc-dotnet-app

# Clean the Database project
rm -rf ./mes-poc-database

# Clean kubernetes config files
rm -rf ./k8s