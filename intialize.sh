# Clone database repo
git clone git@github.com:ping-douglasl/mes-poc-database.git database

# Clone the dotnet app repo
git clone git@github.com:ping-douglasl/mes-poc-dotnet-app.git api

# Run the docker-compose which should reference the Dockerfiles from the sub-projects
docker-compose up