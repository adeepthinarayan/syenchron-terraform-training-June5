resource "aws_instance" "myinstance" {
  ami               = var.amiid
  instance_type     = var.instancetype
  availability_zone = var.az
  tags = {
    Name = var.instancename
  }
}

