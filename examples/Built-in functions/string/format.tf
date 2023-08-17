variable "environment" {
  default = "prod"
}

variable "app_name" {
  default = "myapp"
}

locals {
  s3_bucket_name = format("%s-%s-bucket", var.app_name, var.environment)
}

output "format_function" {
  value = local.s3_bucket_name
}
