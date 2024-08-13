#!/bin/bash

# Function to run Docker containers
run_container() {
    local tag=$1

    echo "Running Docker container for $tag..."
    docker run -it --rm \
        -e DISPLAY=$DISPLAY \
        -e QT_X11_NO_MITSHM=1 \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -e XAUTHORITY=$XAUTH \
        -v /etc/gitconfig:/etc/gitconfig:ro \
        -v ~/.gitconfig:/root/.gitconfig:ro \
        -v /etc/localtime:/etc/localtime:ro \
        -e SSH_AUTH_SOCK -v /run/user/1000/keyring/ssh:/run/user/1000/keyring/ssh \
        -v $XAUTH:$XAUTH \
        --runtime=nvidia \
        $tag zsh
}

# Run container for noetic-zsh
run_container "ros:noetic-zsh"

# Run container for noetic-zsh-nvidia
run_container "ros:noetic-zsh-nvidia"

# Run container for noetic-zsh-nvidia-cuda
run_container "ros:noetic-zsh-nvidia-cuda"

echo "All containers are running."