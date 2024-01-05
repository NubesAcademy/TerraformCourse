locals {
  kubernetes_secret = base64encode("MySuperSecretPassword")
}

output "base64encode_function" {
  value = local.kubernetes_secret
}
