# Submodules

* Personal Website
* Open When

## Installation Instructions

1. Set up ec2 instance with existing vpc, security group, and Ubuntu AMI

    * Can use ssh -i {key} ubuntu@{ip}

2. Update DNS records on Namecheap

3. Install docker

    * sudo apt remove docker docker-engine docker.io containerd runc
    * sudo apt update
    * sudo apt install -y apt-transport-https ca-certificates curl \
      gnupg-agent software-properties-common
    * curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    * sudo add-apt-repository "deb [arch=amd64] \
      https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    * sudo apt update
    * sudo apt install -y docker-ce docker-ce-cli containerd.io
    * sudo groupadd docker
    * sudo usermmod -aG docker $USER
    * newgrp docker
    * sudo systemctl enable docker

4. Log in to docker if necessary

    * docker login
    * Enter username and password

5. Install docker compose

    * sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    * sudo chmod +x /usr/local/bin/docker-compose
    * sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


6. Clone web server repo

    * git clone https://github.com/darrylforbes/web-server
    * Copy over any needed env files

7. Run "docker-compose up -d"
