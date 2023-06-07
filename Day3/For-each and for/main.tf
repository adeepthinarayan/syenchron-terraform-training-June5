variable "environment" {
  default = ["dev", "val", "prod"]
}


resource "aws_instance" "myinstance" {
  ami               = var.amiid
  instance_type     = var.instancetype
  availability_zone = var.az

  for_each = toset(var.environment)

  tags = {
    Name = each.value
  }
}

output "display_ec2_details" {
  value = {
    for instance in aws_instance.myinstance:
     instance.id => instance.public_ip
  }
}