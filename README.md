# Introduction
This project is the _front door_ to the MES POC system. The system is composed of several individual Git repositories each containing their own domain of source code and/or configuration. This project orchestrates, as the name says, those projects together and provides the developer with several tools for getting the whole system up and running as well as testing changes.

# Pre-requisites
* Have Docker Desktop installed locally and running.

# Getting Started
## For VS Code
1. Install VS Code
2. Install WSL (Ubuntu) `wsl --install -d Ubuntu-22.04`
3. Set WSL (Ubuntu) as the default terminal for VS Code.
 - Go to `File` > `Preferences` > `Settings`
 - Search for `wsl`
 - Go to `Features` > `Terminal` and select `Ubuntu (WSL)` from the drop down. ![Alt text](docs/vscode-wsl.png)
4. Configure Docker to use WSL
 - `Settings` > `Resources` > `WSL Integration` - Check the box and toggle the switch for `Ubuntu`![Alt text](docs/docker-wsl.png)
5. Install dotnet sdk in WSL 
 - `sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-7.0`

## For Visual Studio
TBD

# Get the Environment Up and Running
## Set Environment Variables
1. Copy the `.env-dist` file to `.env`
1. Modify the new `.env` file to fit your configuration.

## Using Docker Compose
1. Run `bash ./init.sh compose`

## Using Kubernetes
1. Install Kompose in your WSL Container
1. Run `curl -L https://github.com/kubernetes/kompose/releases/download/v1.31.2/kompose-linux-amd64 -o kompose`
1. Run `bash ./init.sh kompose`

You should now have cloned all the component project repositories to your local machine and docker containers should be spun up.
From here, make any code changes you need to any of the project.

# Extras
## Cleaning
You can _clean_ the project by running `./clean.sh`. This will remove all component project repositories and spin down Docker/Kubernetes and remove any associated images.
