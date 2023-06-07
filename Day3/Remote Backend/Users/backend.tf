terraform {
  backend "s3" {
    bucket = "thinknyx-day3-deepthi"
    key    = "synechron/dev"
    region = "us-east-1"
    dynamodb_table = "synechron-lock"
  }
}
