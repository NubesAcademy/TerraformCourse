resource "aws_s3_bucket" "s3-app" {
  bucket = var.s3_bucket_name
  aws_s3_bucket_acl = "private"

  tags = merge(
    tomap({"Name" = "Mastering Terraform S3 bucket"}),
    var.mandatory_tags
  )
}

resource "aws_vpc_endpoint" "s3-app" {
  service_name = "com.amazonaws.${var.aws_region}.s3"
  vpc_id       = var.aws_vpc_id
}

resource "aws_vpc_endpoint_route_table_association" "s3-app" {
  route_table_id  = ""
  vpc_endpoint_id = aws_vpc_endpoint.s3-app.id
}
