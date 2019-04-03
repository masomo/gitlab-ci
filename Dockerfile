FROM golang:1.11

RUN apt-get -q update && apt-get install -y -q \
    python3-pip \
    jq \
    docker \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install -q docker-compose awscli
