terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73"
    }
  }

  required_version = "1.3.6"
  backend "s3" {
    bucket = "s3-bucket-for-remote-state"
    key    = "project-b.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

data "terraform_remote_state" "project_a" {
  backend = "s3"
  config = {
    bucket = "s3-bucket-for-remote-state"
    key    = "project-a.tfstate"
    region = "eu-west-1"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = data.terraform_remote_state.project_a.outputs.s3_bucket_name
  key    = "testobject.txt"
  content = "Hello, World!"
}
