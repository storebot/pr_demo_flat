resource "aws_s3_bucket" "noS3BucketSseRules" {
  bucket = "mybucket"
  acl    = "private"

  tags = {
    Name        = "nos3BucketSseRules7"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "s3BucketSseRulesWithKmsNull" {
  bucket = "mybucket"
  acl    = "private"

  tags = {
    Name        = "s3BucketSseRulesWithNoKms"
    Environment = "Dev"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "s3BucketNoWebsiteIndexDoc" {
  bucket = "website"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "some-key-id"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "s3VersioningMfaFalse" {
  bucket = "tf-test"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "some-key-id"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled    = true
    mfa_delete = true
  }
}

resource "aws_s3_bucket" "allUsersReadAccess" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "authUsersReadAccess" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "allUsersWriteAccess" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "allUsersReadWriteAccess" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "s3userVersioningMFAOnly" {
  bucket = "s3user-versioning-mfa-only"
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "s3userVersioningOnly" {
  bucket = "s3user-versioning-mfa-only"
  acl    = "private"
  versioning {
    mfa_delete = true
  }
}



resource "aws_s3_bucket_policy" "allUsersReadWriteAccessPolicy" {
  bucket = "${aws_s3_bucket.allUsersReadWriteAccess.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "allUsersReadWriteAccess-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.allUsersReadWriteAccess.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "s3userVersioningOnlyPolicy" {
  bucket = "${aws_s3_bucket.s3userVersioningOnly.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "s3userVersioningOnly-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.s3userVersioningOnly.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "s3userVersioningMFAOnlyPolicy" {
  bucket = "${aws_s3_bucket.s3userVersioningMFAOnly.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "s3userVersioningMFAOnly-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.s3userVersioningMFAOnly.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "allUsersWriteAccessPolicy" {
  bucket = "${aws_s3_bucket.allUsersWriteAccess.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "allUsersWriteAccess-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.allUsersWriteAccess.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "noS3BucketSseRulesPolicy" {
  bucket = "${aws_s3_bucket.noS3BucketSseRules.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "noS3BucketSseRules-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.noS3BucketSseRules.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "s3VersioningMfaFalsePolicy" {
  bucket = "${aws_s3_bucket.s3VersioningMfaFalse.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "s3VersioningMfaFalse-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.s3VersioningMfaFalse.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "authUsersReadAccessPolicy" {
  bucket = "${aws_s3_bucket.authUsersReadAccess.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "authUsersReadAccess-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.authUsersReadAccess.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "allUsersReadAccessPolicy" {
  bucket = "${aws_s3_bucket.allUsersReadAccess.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "allUsersReadAccess-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.allUsersReadAccess.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "s3BucketSseRulesWithKmsNullPolicy" {
  bucket = "${aws_s3_bucket.s3BucketSseRulesWithKmsNull.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "s3BucketSseRulesWithKmsNull-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.s3BucketSseRulesWithKmsNull.id}/*"
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_policy" "s3BucketNoWebsiteIndexDocPolicy" {
  bucket = "${aws_s3_bucket.s3BucketNoWebsiteIndexDoc.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "s3BucketNoWebsiteIndexDoc-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.s3BucketNoWebsiteIndexDoc.id}/*"
    }
  ]
}
POLICY
}