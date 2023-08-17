locals {
  config_file_path = "${path.module}/config.json"
  config = fileexists(local.config_file_path) ? file(local.config_file_path) : null
}
