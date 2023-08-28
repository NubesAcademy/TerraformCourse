variable "string_expression" {
  description = "Think of this as your textual representative in Terraform."
  type = string
  default = "Hello, Terraform!"
}

variable "number_expression" {
  description = "This type is the mathematician of the group."
  type = number
  default = 3.14
}

variable "bool_expression" {
  description = "In the world of computing, everything boils down to binary - 0 or 1, yes or no."
  type = bool
  default = true
}

variable "list_expression" {
  description = "Imagine having a collection of related items."
  type = list(string)
  default = ["red", "green", "yellow"]
}

variable "map_expression" {
  description = "If List is about sequences, Map is about labeling."
  type = list(object({
    name = string
    path = string
    size = number
  }))
  default = [{
    name = "image1.jpg"
    path = "/var/www/images/"
    size = 8192
  }]
}

