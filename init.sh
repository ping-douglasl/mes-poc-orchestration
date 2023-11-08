# Shut down any Docker containers running for this project, remove their images and delete their volumes
docker-compose down --rmi --volumes

# Clean the API project
rm -rf ./mes-poc-dotnet-app

# Clean the Database project
rm -rf ./mes-poc-database

# Clone the API project repo
if ! [ -d "mes-poc-dotnet-app" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-dotnet-app.git
fi

# Clone the Database project repo
if ! [ -d "mes-poc-database" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-database.git
fi

# Run the docker-compose which should reference the Dockerfiles from the sub-projects
docker-compose up