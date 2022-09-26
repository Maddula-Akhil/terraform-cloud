resource "aws_s3_bucket" "sss-bucket" {
  bucket = "my-sss-ttos-bucket"
  tags = {
    Name        = "MY BUCKET"
    Environment = "Dev"
  }
}
