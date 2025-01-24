provider "aws" {
  region = "us-east-1"  # Adjust to your desired AWS region
}

resource "aws_s3_bucket" "static_website" {
  bucket = "samley-bucket12"  # Ensure this matches your existing bucket name
}

# Remove ACL and manage permissions via a policy
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })
}

# Define the website configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.static_website.id
  key    = "index.html"
  source = "../../website/index.html"
  content_type = "text/html"  
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.static_website.id
  key    = "error.html"
  source = "../../website/error.html"
  content_type = "text/html" 
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = true
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}


# Create a CloudFront distribution
resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name = aws_s3_bucket.static_website.bucket_regional_domain_name
    origin_id   = "S3Origin"

    # Configure the S3 origin settings
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.my_identity.id
    }
  }

  # Default cache behavior
  default_cache_behavior {
    target_origin_id       = "S3Origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]


    min_ttl     = 0
    default_ttl = 86400
    max_ttl     = 31536000
  }

  # Viewer settings
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # General settings
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront Distribution for S3 Static Website"
  price_class         = "PriceClass_All"
  default_root_object = "index.html"

  # Restrictions
  restrictions {
    geo_restriction {
      restriction_type = "none"  # Change as needed
    }
  }

  # Tags
  tags = {
    Name = "StaticWebsiteCloudFront"
  }
}