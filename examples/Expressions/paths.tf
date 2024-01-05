// path.module is used to reference the directory of the module that is currently being evaluated.
resource "null_resource" "setup" {
  provisioner "local-exec" {
    command = "${path.module}/setup.sh"
  }
}

// path.root is used to reference the root directory of your Terraform configuration
module "network" {
  source = "${path.root}/modules/network"
}

// path.cwd references the current working directory
locals {
  current_directory = path.cwd
}
