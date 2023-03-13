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


data "aws_availability_zones" "available" {
  state = "available"

  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}


output "available_azs" {
  value = data.aws_availability_zones.available.names
}




