locals {
  mandatory_tags = {
    application          = "Mastering Terraform"
    costCenter           = "nubesacademy"
    dataClassification   = "NULL"
    environment          = "prod"
  }
}

output "jsonencode_function" {
  value = "tags=${jsonencode(local.mandatory_tags)}"
}
