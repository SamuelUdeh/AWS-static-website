output "s3_bucket_website_url" {
  value = "http://${aws_s3_bucket.static_website.bucket}.s3-website-us-east-1.amazonaws.com"
}