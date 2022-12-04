terraform {
  required_version = "1.3.6"
  backend "s3" { }
}

provider "aws" {
  region = "${var.default-region}"
}

