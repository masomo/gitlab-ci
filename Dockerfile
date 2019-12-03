FROM 1.13.4-buster

ENV LC_ALL=C.UTF-8
RUN apt-get -q update && apt-get install -y -q \
    python3-pip \
    jq \
    docker \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    openssh-server \
    software-properties-common \
    php php-zip php-curl php-simplexml && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install -q docker-compose awscli ansible-tower-cli
    

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
