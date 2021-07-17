terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "web_server" {
  ami                    = "ami-00399ec92321828f5"
  availability_zone      = "us-east-2b"
  ebs_optimized          = true
  iam_instance_profile   = "ec2-admin"
  instance_type          = "t3.micro"
  key_name               = "web-server-key-pair"
  subnet_id              = "subnet-902570ea"
  vpc_security_group_ids = ["sg-01e52bfbccd549a76"]
  root_block_device {
    iops        = 3000
    throughput  = 125
    volume_size = 16
    volume_type = "gp3"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.web_server.id
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web_server.id
  allocation_id = aws_eip.eip.id
}
