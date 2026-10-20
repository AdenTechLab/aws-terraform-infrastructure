
# Mock AWS so tests don't require real credentials or create resources.
mock_provider "aws" {}

run "check_project_configuration" {
  command = plan

  assert {
    condition     = output.aws_region == "eu-north-1"
    error_message = "AWS region should be eu-north-1."
  }

  assert {
    condition     = output.environment == "development"
    error_message = "Environment should be development."
  }

  assert {
    condition     = output.project_name == "aden-aws-terraform"
    error_message = "Project name is incorrect."
  }

  assert {
    condition     = aws_cloudwatch_log_group.vpc_flow.retention_in_days == 365
    error_message = "VPC flow logs should be retained for at least one year."
  }

  assert {
    condition     = aws_kms_key.vpc_flow.enable_key_rotation
    error_message = "The VPC flow log encryption key should have rotation enabled."
  }

  assert {
    condition     = aws_flow_log.vpc.traffic_type == "ALL"
    error_message = "VPC flow logs should capture all traffic."
  }
}
