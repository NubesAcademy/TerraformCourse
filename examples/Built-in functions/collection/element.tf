variable "subnets" {
  default = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
}

locals {
  subnet_id = element(var.subnets, 1)
}

output "element_function" {
  value = local.subnet_id
}
