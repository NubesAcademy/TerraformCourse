provider "aws" {
  region = "eu-west-1"
}

module "myvpc" {
  source = "git::https://github.com/<full path to module>.git"

  name = "My VPC"
  cidr = "10.0.0.0/24"
}
