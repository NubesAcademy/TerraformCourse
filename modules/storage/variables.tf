variable "aws_vpc_id" {
  description = "AWS VPC ID which was created for the project"
}

variable "s3_bucket_name" {
  description = "Name of AWS S3 Bucket"
}

variable "aws_region" {
  description = "Default region to deploy infrastructure"
}

#variable "private_subnet" {}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}
