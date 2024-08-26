#!/bin/bash

# Function to run Docker containers
run_container() {
    local tag=$1

    echo "Running Docker container for $tag..."
    docker run -it --rm \
        --network host \
        -e DISPLAY=$DISPLAY \
        -e QT_X11_NO_MITSHM=1 \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -e XAUTHORITY=$XAUTH \
        -v /etc/localtime:/etc/localtime:ro \
        -e SSH_AUTH_SOCK -v /run/user/1000/keyring/ssh:/run/user/1000/keyring/ssh \
        -v $XAUTH:$XAUTH \
        --gpus 'all,"capabilities=compute,video,graphics,utility"' \
        $tag zsh
}

 
# Run container for noetic-zsh
run_container "ros:noetic-zsh"

# Run container for noetic-zsh-cuda
run_container "ros:noetic-zsh-cuda"

# Run container for noetic-zsh-pytorch
run_container "ros:noetic-zsh-pytorch"

# Run container for noetic-zsh-cuda-pytorch
run_container "ros:noetic-zsh-cuda-pytorch"

echo "All containers are running."