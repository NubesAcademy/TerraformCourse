variable "list" {
  description = "List of string values"
  type = list(string)
  default = ["red", "green", "blue"]
}

variable "map" {
  description = "Map of key/value"
  type = map(string)
  default = {
    "Name" = "Example"
    "Region" = "Oregon"
  }
}

// basic form of a for expression
locals {
  example_1 = [for s in var.list : upper(s)]
}

output "example_1" {
  value = local.example_1
}

// k refers to the key or attribute name of the current element, and v refers to the value of the current element
locals {
  example_2 = [for k, v in var.map : (length(k)+length(v))]
}

output "example_2" {
  value = local.example_2
}

// Using curly braces produces an object and you must provide two result expressions separated by the special symbol
locals {
  example_3 = {for s in var.list : s => upper(s)}
}

output "example_3" {
  value = local.example_3
}

// only the non-empty values from var.list are transformed to uppercase
locals {
  example_4 = [for s in var.list : upper(s) if s != ""]
}

output "example_4" {
  value = local.example_4
}


