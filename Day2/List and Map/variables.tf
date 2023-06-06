variable "amiid" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "instancetype" {
  # type    = list(string)
  #  default = ["t2.micro","t2.small","t2.nano"]

  type = map(string)
  default = {
    "type1" = "t2.micro",
    "type2" = "t2.small",
    "type3" = "t2.nano",
  }
}

variable "az" {
  type    = map(string)
  #  default = ["us-east-1a","us-east-1b","us-east-1c"]
  default = {
    "az1" = "us-east-1a",
    "az2" = "us-east-1b",
    "az3" = "us-east-1c",
  }
}

variable "instancename" {
  type    = string
  default = "deepthiec2"
}
