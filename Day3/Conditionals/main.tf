# variable "length" {
#   type = number
# }

# resource "random_password" "my_password" {
#   length = var.length < 8 ? 8 : var.length
#   }

variable "demo" {
  default = ["john", "deepthi"]
}

variable "demo2" {
  default ="deepthi"
}