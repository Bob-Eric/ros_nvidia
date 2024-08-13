FROM osrf/ros:noetic-desktop-full

# Install zsh and on-my-zsh
RUN  apt-get update && apt-get install zsh wget curl git -y && \
    sh -c "$(wget -O- https://gitee.com/Bob-Eric/zsh-in-docker/releases/download/v1.0.0/zsh-in-docker.sh)" -- \
    -t robbyrussell\
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/zsh-users/zsh-completions \
    && apt-get clean

# Install mesa
RUN apt update && apt install mesa-utils 