
run "check_project_configuration" {
  command = plan

  assert {
    condition     = local.project_name == "aden-aws-terraform"
    error_message = "The project name must match the expected value."
  }

  assert {
    condition     = local.environment == "development"
    error_message = "The environment must be development."
  }

  assert {
    condition     = var.aws_region == "eu-west-2"
    error_message = "The AWS region must be eu-west-2."
  }

  assert {
    condition     = local.common_tags["ManagedBy"] == "Terraform"
    error_message = "Resources must identify Terraform as their management tool."
  }

  assert {
    condition = (
      contains(keys(local.common_tags), "Project") &&
      contains(keys(local.common_tags), "Environment") &&
      contains(keys(local.common_tags), "ManagedBy")
    )
    error_message = "Required project, environment and management tags must be present."
  }
}
