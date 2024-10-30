# This is S3 TF creation
# Added checkov checks

resource "aws_s3_bucket" "example" {
  #checkov:skip=CKV2_AWS_62:No need for event notification
  #checkov:skip=CKV_AWS_18:No access loggin required
  #checkov:skip=CKV_AWS_144:No need for cross-region relication
  #checkov:skip=CKV_AWS_145:No KMS
  #checkov:skip=CKV2_AWS_61: No need for lifecycle configuration
  #checkov:skip=CKV_AWS_56: 
  bucket = "lcchua-terraform-ci-bucket"
}

resource "aws_s3_bucket_public_access_block" "access_good_1" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}


