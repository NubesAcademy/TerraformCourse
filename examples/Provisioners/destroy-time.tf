// Destroy-time Provisioners

resource "null_resource" "example" {
  provisioner "local-exec" {
    when    = "destroy"
    command = "echo 'Resource destroyed!'"
  }
}
