variable "env" {
  description = "Development environment"
  type = string
  default = "dev"
}

variable "region" {
  description = "AWS Region"
  type = string
  default = "dev"
}

// instance type output will be t2.micro if the environment variable is prod, and t2.nano otherwise
output "instance_type_example_1" {
  value = var.env == "prod" ? "t2.micro" : "t2.nano"
}

// instance type output will be t2.micro only if environment is production and region is Oregon, otherwise it will be t2.nano
output "instance_type_example_2" {
  value = var.env == "prod" && var.region == "us-west-2" ? "t2.micro" : "t2.nano"
}

// if environment is production, the instance type will be t2.micro if the region is Oregon, and t2.small otherwise. If environment is not production, the instance type will be t2.nano.
output "instance_type_example_3" {
  value = var.env == "prod" ? (var.region == "us-west-2" ? "t2.micro" : "t2.small") : "t2.nano"
}
