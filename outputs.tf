output "s3_bucket" {
 description = "S3 Bucket from AWS Console"
 value       = data.aws_s3_bucket.public.id
 }
