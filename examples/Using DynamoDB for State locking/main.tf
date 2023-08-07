terraform {
  required_providers {
    aws = {
      source    = "hashicorp/aws"
      version   = "~> 3.73"
    }
  }

  required_version = "1.3.6"
  backend "s3" {
    bucket          = "s3-bucket-for-remote-state"
    key             = "state.tfstate"
    region          = "eu-west-1"
    dynamodb_table  = "mastering-terraform-state-lock"
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "bastion" {
  ami = "ami-05e786af422f8082a"
  instance_type = "t3a.micro"
  ebs_optimized = true

  root_block_device {
    volume_type = "gp3"
    volume_size = "10"
    delete_on_termination = true
  }
}

