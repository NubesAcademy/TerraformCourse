provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami = "ami-05e786af422f8082a"
  instance_type = "t3a.micro"
  ebs_optimized = true

  root_block_device {
    volume_type = "gp3"
    volume_size = "10"
    delete_on_termination = true
  }
}
