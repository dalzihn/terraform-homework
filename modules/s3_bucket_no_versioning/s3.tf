resource "aws_s3_bucket" "this_bucket" {
  bucket = var.bucket_name

  tags = {
    name = var.bucket_name
  }
}