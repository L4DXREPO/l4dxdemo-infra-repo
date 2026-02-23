resource "random_id" "bucket_suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "main" {
  bucket = "l4dxdemo-test-bucket-${random_id.bucket_suffix.hex}"
}
