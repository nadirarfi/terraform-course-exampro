terraform {
  backend "local" {

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}



provider "aws" {
  region = "eu-west-3"
}


resource "aws_default_vpc" "my_vpc" {
  tags = {
    Name = "Nadir VPC"
  }
}

# Create Security Group to allow port 22 SSH
resource "aws_security_group" "sg_ssh" {
  name        = "sg_ssh"
  description = "Allow secure SSH connection"
  vpc_id      = aws_default_vpc.my_vpc.id

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SSH Security Group"
  }
}




resource "aws_instance" "my_server" {
  ami                    = var.INSTANCE_AMI
  instance_type          = var.INSTANCE_TYPE
  key_name               = "my_key"
  vpc_security_group_ids = [aws_security_group.sg_ssh.id]

  tags = {
    Name = "server-${local.USER_NAME}"
  }

}

