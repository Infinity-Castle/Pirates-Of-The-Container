#!/bin/bash



# Check if the container exists
if docker ps -a --filter "name=cosmic" --format "{{.Names}}" | grep -q "cosmic"; then
    echo "Container 'cosmic' already exists. Starting and attaching to it..."
    docker start cosmic
    docker attach cosmic
else
    if docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "^sid1164/galaxy:latest$"; then
        echo "Level already exists"
    else
        echo "Pulling level..."
        docker pull sid1164/galaxy &> /dev/null
    fi

    echo "Creating and running the container..."
    docker run --hostname wlug --user root -v /var/run/docker.sock:/var/run/docker.sock -it --name cosmic sid1164/galaxy sh
fi
