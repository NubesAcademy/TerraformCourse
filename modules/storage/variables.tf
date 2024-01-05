variable "aws_vpc_id" {
  description = "AWS VPC ID which was created for the project"
}

variable "s3_bucket_name" {
  description = "Name of AWS S3 Bucket"
}

variable "aws_region" {
  description = "Default region to deploy infrastructure"
}

variable "aws_vpc_route_tables" {
  type = list(string)
  description = "List of AWS VPC Route tables"
}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}
