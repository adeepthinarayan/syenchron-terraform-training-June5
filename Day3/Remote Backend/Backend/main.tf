resource "aws_s3_bucket" "thinknyx_s3" {
  bucket = "thinknyx-day3-deepthi"
  lifecycle {
    prevent_destroy = true
  }
  force_destroy = true
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "synechron-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
