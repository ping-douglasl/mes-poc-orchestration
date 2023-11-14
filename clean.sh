# Clean the API project
rm -rf ./mes-poc-dotnet-app

# Clean the Database project
rm -rf ./mes-poc-database

kubectl delete deployments --all -n default