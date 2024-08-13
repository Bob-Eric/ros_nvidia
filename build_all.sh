#!/bin/bash

# Function to build Docker images
build_image() {
    local dir=$1
    local tag=$2

    echo "Building Docker image for $dir with tag $tag..."
    docker build -t $tag --network host $dir
}

# Build images for each directory
build_image "noetic-zsh" "ros:noetic-zsh"
build_image "noetic-zsh-nvidia" "ros:noetic-zsh-nvidia"
build_image "noetic-zsh-nvidia-cuda" "ros:noetic-zsh-nvidia-cuda"

echo "All images built successfully."