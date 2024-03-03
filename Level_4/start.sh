#!/bin/bash

# If docker not in machine install docker
if ! command -v "docker" &> /dev/null; then
    clear
    echo "Please wait..."
    echo "Updating..."
    sudo apt update &> /dev/null
    echo "Installing Docker..."
    sudo snap install docker &> /dev/null
    echo "Done."
else
    echo "Docker already exists"
fi

# Check if the container exists
if docker ps -a --filter "name=the_game" --format "{{.Names}}" | grep -q "the_game"; then
    echo "Container 'the_game' already exists. Starting and attaching to it..."
    docker start the_game
    docker attach the_game
else
    if docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "^wildwarrior44/game:latest$"; then
        echo "Level already exists"
    else
        echo "Pulling level..."
        docker pull wildwarrior44/game &> /dev/null
    fi

    echo "Creating and running the container..."
    docker run --hostname wlug --user root -v /var/run/docker.sock:/var/run/docker.sock -it --name the_game wildwarrior44/game /bin/bash
fi
