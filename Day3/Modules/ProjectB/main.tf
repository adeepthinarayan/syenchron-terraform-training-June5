module "ec2-instance4" {
  source  = "adeepthinarayan/ec2-instance4/aws"
  version = "1.0.0"
  instancetype = "t2.nano"
}