variable "vpc_subnets" {
  default = [
    ["subnet-abcde012", "subnet-bcde012a"],
    ["subnet-fghi345a", "subnet-jklm678a"]
  ]
}

locals {
  flat_subnets = flatten(var.vpc_subnets)
}

output "flatten_function" {
  value = local.flat_subnets
}
