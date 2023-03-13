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

locals {
  MY_NAME = "Nadir"
}

variable "INSTANCE_AMI" {
  type = string
}


provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "nadir-bucket-11-test-london"
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
  instance_type          = "t2.micro"
  key_name               = "my_key"
  vpc_security_group_ids = [aws_security_group.sg_ssh.id]

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/home/ec2-user/testing_file_provisioner.txt"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("my_key.pem")

    }

  }



  provisioner "remote-exec" {
    inline = [
      "echo ${self.private_ip} >> /home/ec2-user/private_ips.txt"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("my_key.pem")

    }
  }


  tags = {
    Name = "server-${local.MY_NAME}"
  }

}

output "public_ip" {
  value = aws_instance.my_server.public_ip
}