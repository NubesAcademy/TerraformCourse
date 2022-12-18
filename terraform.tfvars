aws_region = "eu-west-1"

aws_vpc_cidr = "10.2.0.0/16"
aws_vpc_azs = 2
aws_vpc_db_subnets = ["10.2.50.0/24", "10.2.51.0/24"]

aws_ec2_type = "t3.micro"

mandatory_tags = {
  "env"     = "dev"
  "owner"   = "Oleksiy Pototskyy"
  "email"   = "alexei.potocki@gmail.com"
  "website" = "https://nubes.academy"
  "project" = "Mastering Terraform"
}
