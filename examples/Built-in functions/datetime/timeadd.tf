locals {
  start_time = "2023-04-05T15:04:05Z"
  end_time = timeadd(local.start_time, "72h")
}

output "timeadd_function" {
  value = local.end_time
}
