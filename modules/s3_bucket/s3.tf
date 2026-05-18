resource "aws_s3_bucket" "this_bucket" {
  bucket = var.bucket_name

  tags = {
    name = var.bucket_name
  }
}

resource "aws_s3_bucket_versioning" "this_bucket" {
  bucket = aws_s3_bucket.this_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
