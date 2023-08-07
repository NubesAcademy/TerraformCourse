provider "aws" {
  access_key = "AWS_ACCESS_KEY"
  secret_key = "AWS_SECRET_KEY"
  region     = "eu-west-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "list_of_az" {
  value = data.aws_availability_zones.available.names
}
