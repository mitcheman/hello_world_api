resource "aws_s3_bucket" "hello_world_bucket" {
  bucket = "hell0000_world_bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "hello world"
    Environment = "Dev"
  }
}