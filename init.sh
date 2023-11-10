./clean.sh

# Clone the API project repo
if ! [ -d "mes-poc-dotnet-app" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-dotnet-app.git
fi

# Clone the Database project repo
if ! [ -d "mes-poc-database" ]; then
    git clone git@github.com:ping-douglasl/mes-poc-database.git
fi

# Load environment variables
if [ -f .env ]; then
  source .env
  echo "Environment variables from .env file are loaded."
else
  echo "The .env file does not exist."
fi

# Check if an argument is provided
if [ -z "$1" ]; then
  # Set a default value if the argument is empty
  arg="docker"
else
  # Use the provided argument
  arg="$1"
fi

case "$arg" in
    "docker")
        docker-compose up
        ;;
    "kubernetes")
        kompose convert -o k8s/
        kubectl apply -f ./k8s
        ;;
    *)
        echo "Supported values are 'docker' or 'kubernetes'"
        ;;
esac