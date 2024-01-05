locals {
  config_yaml = yamlencode({
    "log_level" = "debug"
    "backend" = "localhost"
  })
}

output "yamlencode_function" {
  value = local.config_yaml
}

