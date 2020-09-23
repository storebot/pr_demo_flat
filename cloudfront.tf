resource "aws_cloudfront_distribution" "s3-distribution-TLS-v1" {
  origin {
    domain_name = "aws_s3_bucket.b.bucket_regional_domain_name"
    origin_id   = "local.s3_origin_id"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    }
  }

  enabled = true

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "local.s3_origin_id"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "https-only"
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "local.s3_origin_id"

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    compress               = true
    viewer_protocol_policy = "allow-all"
  }

  #viewer_protocol_policy = "redirect-to-https" is the expected configuration
  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "local.s3_origin_id"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  # logging_config {
  #   include_cookies = false
  #   bucket          = "mylogs.s3.amazonaws.com"
  #   prefix          = "myprefix"
  # }

  viewer_certificate {
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1" #expected version is TLSv1.1 or TLSv1.2 
  }
}


locals {
  s3_origin_id = "myS3Origin"
}