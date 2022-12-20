resource "aws_s3_bucket" "s3-app" {
  bucket = var.s3_bucket_name

  tags = merge(
    tomap({"Name" = "Mastering Terraform S3 bucket"}),
    var.mandatory_tags
  )
}

resource "aws_s3_bucket_acl" "s3-app" {
  bucket = aws_s3_bucket.s3-app.id
  acl    = "private"
}

resource "aws_vpc_endpoint" "s3-app" {
  service_name = "com.amazonaws.${var.aws_region}.s3"
  vpc_id       = var.aws_vpc_id
}

resource "aws_vpc_endpoint_route_table_association" "s3-app" {
  count = length(var.aws_vpc_route_tables)

  route_table_id  = element(var.aws_vpc_route_tables, count.index)
  vpc_endpoint_id = aws_vpc_endpoint.s3-app.id
}
