resource "kubernetes_secret" "example" {
  #...
  data = {
    password = filebase64("${path.module}/password.txt")
  }
  #...
}
