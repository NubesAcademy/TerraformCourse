// Creation-time Provisioners

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Resource created!'"
  }
}

