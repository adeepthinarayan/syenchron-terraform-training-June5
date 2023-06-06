resource "aws_instance" "myinstance" {
  ami               = var.amiid
  instance_type     = var.instancetype
  availability_zone = var.az
  tags = {
    Name = var.instancename
  }
}

resource "aws_eip" "myec2_eip" {
}

resource "aws_eip_association" "associateEc2withEIP" {
  instance_id = aws_instance.myinstance.id
  allocation_id = aws_eip.myec2_eip.id
}