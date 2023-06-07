resource "aws_instance" "myinstance" {
  ami               = var.amiid
  instance_type     = var.instancetype
  availability_zone = var.az
  tags = {
    Name = var.instancename
  }
}

resource "null_resource" "my_null_resource" {
  triggers = {
    id = timestamp()
  }
  provisioner "local-exec" {
    command = "echo Hello everyone"
  }
}