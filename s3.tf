resource "aws_s3_bucket" "sss-bucket" {
  bucket = "my-sss-ttos-bucket"
  tags = {
    Name        = "MY BUCKET"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_policy" "all_access" {
  bucket = aws_s3_bucket.sss-bucket.id
  policy = data.aws_iam_policy_document.all_access.json
}

data "aws_iam_policy_document" "all_access" {
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

data "aws_s3_bucket" "all" {
 bucket = "terraform-scriptbucket"
}
