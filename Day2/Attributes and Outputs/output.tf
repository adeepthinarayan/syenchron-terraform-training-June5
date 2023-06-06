output "instanceID" {
  value = "The public IP of the instance ${aws_instance.myinstance.id} is ${aws_instance.myinstance.public_ip}"
}