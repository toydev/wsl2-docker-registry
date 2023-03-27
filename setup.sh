#!/bin/bash

docker --version > /dev/null 2>&1
if [ "$?" != "0" ]; then
    echo "[$(date "+%Y/%m/%d %H:%M:%S")] Docker をインストールします。"

    ## Docker Engine をインストールする。
    # https://docs.docker.com/engine/install/ubuntu/
    sudo apt-get -y install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    USERNAME=$(whoami)
    sudo usermod -aG docker $USERNAME
fi

mkcert --version > /dev/null 2>&1
if [ "$?" != "0" ]; then
    echo "[$(date "+%Y/%m/%d %H:%M:%S")] mkcert をインストールします。"

    sudo apt install mkcert -y
fi
