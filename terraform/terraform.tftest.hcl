
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
}
