variable "subnets" {
  default = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
}

locals {
  subnet_id = join(",", var.subnets)
}

output "join_function" {
  value = local.subnet_id
}

