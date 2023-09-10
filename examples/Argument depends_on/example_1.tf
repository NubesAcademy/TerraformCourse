// Order of Creation Matters

resource "null_resource" "upload_file" {
  # using local-exec provisioner to upload file
}

resource "aws_instance" "example" {
  # other configurations
  depends_on = [null_resource.upload_file]
}
