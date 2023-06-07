resource "aws_instance" "myinstance" {
  ami               = var.amiid
  instance_type     = var.instancetype
  availability_zone = var.az
  tags = {
    Name = var.instancename
  }

  count =3 
}

output "public_ip" {
  value = join(" ",aws_instance.myinstance.*.public_ip)
}