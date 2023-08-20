locals {
  start_time = "2023-04-05T15:04:05Z"
  formatted_start_time = formatdate("DD MMM YYYY hh:mm ZZZ", local.start_time)
}

output "formatdate_function" {
  value = local.formatted_start_time
}
