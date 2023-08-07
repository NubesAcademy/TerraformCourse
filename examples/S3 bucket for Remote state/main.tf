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
    key    = "state.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

