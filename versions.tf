terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73"
    }
  }

  required_version = "1.3.6"
  backend "s3" { }
}
