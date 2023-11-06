if ! [ -d "database" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-database.git database
fi

if ! [ -d "api" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-dotnet-app.git api
fi

# Run the docker-compose which should reference the Dockerfiles from the sub-projects
docker-compose up