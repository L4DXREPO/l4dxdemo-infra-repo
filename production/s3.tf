resource "aws_s3_bucket" "scp_test_bucket" {
  bucket = "scp-test-bucket-terraform-demo-12345"

  tags = {
    Name        = "scp-test"
    Environment = "test"
  }
}