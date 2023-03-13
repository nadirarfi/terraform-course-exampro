terraform {


  cloud {
    organization = "nadirarfi"
    workspaces {
      name = "learn-terraform-cloud-migrate"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  alias  = "ireland"
}

provider "aws" {
  region = "eu-west-3"
  alias  = "paris"
}


resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  provider = aws.paris
  
  tags = {
    Name = "Nadir VPC"
  }
}

resource "aws_instance" "my_server" {
  ami           = var.INSTANCE_AMI
  instance_type = "t2.micro"

  tags = {
    Name = "server-${local.MY_NAME}"
  }

}
