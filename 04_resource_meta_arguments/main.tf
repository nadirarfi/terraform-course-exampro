provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "eu-west-3"
  alias  = "paris"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "ss3test-depends-on-bucket-testing-nadir"
    lifecycle {
      prevent_destroy = false
    }
}

resource "aws_instance" "my_server" {
  provider      = aws.paris
  ami           = "ami-06b6c7fea532f597e"
  instance_type = "t2.micro"
  key_name      = "my_key"
  depends_on = [
    aws_s3_bucket.bucket
  ]

  count = 3
  tags = {
    Name = "server-nadir-${count.index}"
  }

}

resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key
}

output "public_ip" {
  value = aws_instance.my_server[*].public_ip
}
