// Creating Multiple Resources with Complex Input

variable "users" {
  description = "Map of user configurations"
  type        = map(object({
    name  = string
    email = string
  }))
  default = {
    user1 = { name = "John Doe", email = "john@example.com" }
    user2 = { name = "Jane Doe", email = "jane@example.com" }
  }
}

resource "example_resource" "user" {
  for_each = var.users

  name  = each.value.name
  email = each.value.email
}
