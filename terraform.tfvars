aws_region = "eu-west-1"

aws_vpc_cidr = "10.2.0.0/16"
aws_vpc_azs = 2
aws_vpc_db_subnets = ["10.2.50.0/24", "10.2.51.0/24"]

aws_app_ec2_type = "t3a.micro"

aws_bastion_ec2_type = "t3a.micro"
aws_bastion_ami = "ami-05e786af422f8082a"

aws_db_type = "db.t3.micro"
aws_db_name = "terraform"

domain_name = "terraform.nubes.academy"

s3_bucket_name = "mastering-terraform-project"

mandatory_tags = {
  "owner"   = "Oleksiy Pototskyy"
  "email"   = "oleksiy@pototskyy.net"
  "website" = "https://www.nubes.academy"
  "project" = "Mastering Terraform: from Zero to Certified Professional"
}
