module "ec2module" {
  source       = "../EC2_Module"
  instancename = "johnec2"
  az           = "us-east-1b"
}