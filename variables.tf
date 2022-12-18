variable "default_region" {
  description = "Default region to deploy our infrastructure"
}

variable "vpc_cidr" {
  description = "Virtual Private Cloud Subnet"
  default = "10.1.0.0/16"
}

variable "vpc_az_count" {
  type = number
  description = "In which AZs we want to deploy our infrastructure"
}

variable "vpc_db_subnets" {
  type = list(string)
  description = ""
}

variable "mandatory_tags" {
  type = map(string)
  description = "Mandatory TAGs for all AWS resources"
}
