locals {
  project_name = "aden-aws-terraform"
  environment  = "development"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}
