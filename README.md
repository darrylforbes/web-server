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

4. Clone web server repo

    * git clone --recurse-submodules https://github.com/darrylforbes/web-server
