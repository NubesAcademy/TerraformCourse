variable "request_rate" {
  default = 700
}

variable "requests_per_instance" {
  default = 500
}

locals {
  instance_count = ceil(var.request_rate / var.requests_per_instance)
}

output "ceil_function" {
  value = local.instance_count
}
