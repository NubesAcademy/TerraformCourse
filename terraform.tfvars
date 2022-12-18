default_region = "eu-west-1"

vpc_cidr = "10.2.0.0/16"
vpc_az_count = 2
vpc_db_subnets = ["10.2.50.0/24", "10.2.51.0/24"]

mandatory_tags = {
  "env"     = "dev"
  "owner"   = "Oleksiy Pototskyy"
  "email"   = "alexei.potocki@gmail.com"
  "website" = "https://nubes.academy"
  "project" = "Mastering Terraform"
}
