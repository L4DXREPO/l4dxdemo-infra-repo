#####################################
# Production - VPC Flow Logs
#####################################

resource "aws_flow_log" "prod_flow" {
  provider             = aws.production
  vpc_id               = "vpc-0b45ca20e930215cb"   # <-- REPLACE THIS
  traffic_type         = "ALL"
  log_destination_type = "s3"
  log_destination      = aws_s3_bucket.vpc_logs.arn

  depends_on = [aws_s3_bucket_policy.vpc_flow_policy]
}

#####################################
# Production - CloudTrail
#####################################

resource "aws_cloudtrail" "prod_trail" {
  provider                      = aws.production
  name                          = "prod-api-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  depends_on = [aws_s3_bucket_policy.cloudtrail_policy]
}
