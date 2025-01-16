output "s3_bucket_arn" {
  value       = aws_s3_bucket.image_bucket.arn
  description = "S3 Bucket ARN"
}
