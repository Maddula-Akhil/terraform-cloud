resource "aws_s3_bucket" "sss-bucket" {
  bucket = "my-sss-ttos-bucket"
  tags = {
    Name        = "MY BUCKET"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.sss-bucket.id
  policy = data.aws_iam_policy_document.public_access.json
}

data "aws_iam_policy_document" "public_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:*"
    ]

    resources = [
      "${aws_s3_bucket.sss-bucket.arn}",
      "${aws_s3_bucket.sss-bucket.arn}/*"
    ]
  }
}

data "aws_s3_bucket" "public" {
 bucket = "terraform-scriptbucket"
}
