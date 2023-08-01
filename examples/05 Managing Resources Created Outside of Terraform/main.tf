# terraform import aws_s3_bucket.bucket mastering-terraform-s3-bucket

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
  # Resource arguments, if any, can be filled in later
}
