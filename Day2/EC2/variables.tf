# variable "amiid" {
#   type    = string
#   default = "ami-053b0d53c279acc90"
# }

variable "instancetype" {
  type    = string
   default = "t2.micro"
}

variable "az" {
  type    = string
   default = "us-east-1a"
}

variable "instancename" {
  type    = string
  default = "deepthiec2"
}

variable "aws_key" {
  default = "thinknyxKeyPair.pem"
}
