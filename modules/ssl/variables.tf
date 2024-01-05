variable "domain_name" {
  description = "Domain name which will be used for AWS resources, e.g. youdomain.com"
}

variable "domain_zone_id" {
  description = "AWS Route53 Zone ID"
}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}
