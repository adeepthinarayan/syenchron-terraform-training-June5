resource "aws_instance" "myinstance" {
  ami               = var.amiid
  # instance_type     = var.instancetype[1]
  instance_type = var.instancetype["type2"]
  availability_zone = var.az["az3"]
  tags = {
    Name = var.instancename
  }
}