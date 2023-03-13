terraform {

}

provider "aws" {
  region = "eu-west-3"
}

module "apache" {
	source = "./terraform-aws-apache-test"
	vpc_id = ""
	my_ip_with_cidr = "172.31.0.5/32"
	key_name = ""
	instance_type = "t2.micro"
 	server_name = "Apache Example Server"
}

output "public_ip" {
  value = module.apache.public_ip
}




