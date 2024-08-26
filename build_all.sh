#!/bin/bash

# Function to build Docker images
build_image() {
    local dir=$1
    local tag=$2

    echo "Building Docker image for $dir with tag $tag..."
    docker build -t $tag --network host $dir
}

# Build images for each directory
# build_image "noetic-zsh" "ros:noetic-zsh"
build_image "noetic-zsh-cuda" "ros:noetic-zsh-cuda"
build_image "noetic-zsh-cuda-pytorch" "ros:noetic-zsh-cuda-pytorch"
build_image "noetic-zsh-pytorch" "ros:noetic-zsh-pytorch"

echo "All images built successfully."