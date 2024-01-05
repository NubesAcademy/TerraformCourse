provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "application" {
ami           = "ami-0f1ee917b10382dea"
instance_type = var.instance_type
}
