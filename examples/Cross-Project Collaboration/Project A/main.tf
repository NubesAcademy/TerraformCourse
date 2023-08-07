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
    key    = "project-a.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "mastering-terraform-project-a-bucket"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.id
}
