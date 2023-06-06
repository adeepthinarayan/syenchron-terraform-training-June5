provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "thinknyxec2" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  tags = {
    Name = "deepthiec2"
  }
}

resource "aws_instance" "thinknyxmyec2" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  tags = {
    Name = "deepthiec2"
  }
}