provider "aws" {
  region = "eu-west-1"
}

module "ec2" {
  source = "./ec2_instance"

  aws_ec2_type = "t3a.micro"
}

output "public_ip" {
  value = module.ec2.ec2_public_ip
}
