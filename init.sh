# Shut down any Docker containers running for this project, remove their images and delete their volumes
docker-compose down --rmi --volumes

# Clean the API project
rm -rf ./api

# Clean the Database project
rm -rf ./database

# Clone the Database project repo
if ! [ -d "database" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-database.git database
fi

# Clone the API project repo
if ! [ -d "api" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-dotnet-app.git api
fi

# Run the docker-compose which should reference the Dockerfiles from the sub-projects
docker-compose up