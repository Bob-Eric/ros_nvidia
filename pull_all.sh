#!/bin/bash

# Function to tag and push Docker images
pull_image() {
  local image=$1
  local registry=$2

  echo "Pulling and tagging $image to $registry..."
  docker pull $registry
  docker tag $registry $image
}

# Define the registry base URL
registry_base="registry.cn-hangzhou.aliyuncs.com/chy-sci"

# Pull images
pull_image "ros:noetic-zsh" "$registry_base/ros:noetic-zsh"
pull_image "ros:noetic-zsh-nvidia" "$registry_base/ros:noetic-zsh-nvidia"
pull_image "ros:noetic-zsh-nvidia-cuda" "$registry_base/ros:noetic-zsh-nvidia-cuda"

echo "All images have been pulled."
