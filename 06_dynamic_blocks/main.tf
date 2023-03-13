provider "aws" {
  region = "eu-west-3"
}


resource "aws_default_vpc" "my_vpc" {
  tags = {
    Name = "Nadir VPC"
  }
}

# Create Security Group to allow port 22 SSH
resource "aws_security_group" "my_sg" {
  name   = "my_sg"
  vpc_id = aws_default_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description      = ingress.value.description
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
    }
  }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "My Security Group"
  }
}

