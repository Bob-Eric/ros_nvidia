FROM ros:noetic-zsh

RUN apt-get update && apt-get install -y \
    python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 

RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip3 install networkx && \
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124 && \
    rm -rf ~/.cache/pip
