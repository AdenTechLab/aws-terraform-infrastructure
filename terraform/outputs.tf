output "project_name" {
  description = "Name of the Terraform project"
  value       = local.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = local.environment
}

output "aws_region" {
  description = "AWS region configured for deployment"
  value       = var.aws_region
}
