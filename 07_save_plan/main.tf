provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "nadir_server" {
  provider      = aws
  ami           = "ami-06b6c7fea532f597e"
  instance_type = "t2.micro"
  key_name      = "my_key"

  tags = {
    Name = "server-nadir"
  }

}
output "public_ip" {
  value = aws_instance.nadir_server.public_ip
}