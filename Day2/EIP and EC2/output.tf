output "EC2_ID_EIP_IP" {
  value = "The EIP of the instance ${aws_instance.myinstance.id} is ${aws_eip.myec2_eip.public_ip}"
}