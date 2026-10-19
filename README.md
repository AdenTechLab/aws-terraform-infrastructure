# AWS Infrastructure with Terraform

An Infrastructure as Code (IaC) portfolio project focused on AWS infrastructure design, Terraform automation, automated testing, security best practices and cost awareness.

The project uses Terraform to define infrastructure configuration and GitHub Actions to automate formatting, validation, testing and security scanning.

## Project Objectives

- Define and manage infrastructure configuration using Terraform.
- Use variables, outputs and reusable resource-tagging conventions.
- Automate Terraform quality checks through GitHub Actions.
- Apply security-first principles to infrastructure design.
- Understand cloud permissions, deployment planning and cost controls.
- Practise infrastructure testing and continuous integration.

## Technology Stack

- **Cloud:** Amazon Web Services (AWS)
- **Infrastructure as Code:** Terraform
- **Version Control:** Git and GitHub
- **CI/CD:** GitHub Actions
- **Security Scanning:** Checkov
- **Development Environment:** GitHub Codespaces and AWS CloudShell

## Repository Structure

```text
aws-terraform-infrastructure/
├── .github/
│   └── workflows/
│       └── terraform-ci.yml
├── terraform/
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tftest.hcl
│   └── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## Terraform Configuration

The current configuration includes:

- AWS provider configuration for the London region (`eu-west-2`).
- Project and environment metadata.
- Common tags for project identification and management.
- Outputs for the project name, environment and AWS region.
- Automated tests for project configuration and required tagging conventions.

The VPC and subnet configuration remains a planned infrastructure milestone. Deployment was blocked by an explicit AWS Organizations Service Control Policy (SCP) denying the required EC2 networking permissions.

## Security and Cost Awareness

Security and cost control are important considerations throughout the project.

- Terraform state files and sensitive variable files are excluded from version control.
- AWS credentials are not stored in the repository.
- GitHub Actions uses read-only repository permissions for CI.
- Terraform configuration is checked before deployment.
- Checkov scans the Terraform configuration for potential security issues.
- AWS permissions and service restrictions are reviewed before deployment.
- The AWS account is kept on its existing Free plan.

## Continuous Integration

GitHub Actions automatically runs checks when changes are pushed to the `main` branch or when a pull request targets `main`.

The workflow includes:

1. Terraform formatting checks.
2. Terraform initialisation without configuring a remote backend.
3. Terraform configuration validation.
4. Automated Terraform tests.
5. Checkov infrastructure security scanning.

**Current CI status: Passing.**

The workflow validates and tests the configuration without deploying AWS infrastructure or requiring AWS credentials.

## Validation

Run these commands from the `terraform` directory:

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
terraform test
terraform plan
```

These commands check formatting, initialise the provider configuration, validate the Terraform files, run automated tests and preview the proposed changes.

## Current Status

- Terraform configuration and outputs implemented.
- Five automated assertions covering project configuration and tagging.
- GitHub repository and version control configured.
- GitHub Actions workflow passing.
- Checkov security scanning integrated into CI.
- AWS infrastructure deployment blocked by an explicit AWS Organizations SCP.

**No VPC or subnet has been successfully deployed by this project.**

## Future Improvements

- Resolve the AWS permission restriction through the account administrator or use an authorised AWS environment.
- Implement and test the VPC and subnet configuration when deployment is permitted.
- Expand automated tests to cover infrastructure resource properties.
- Improve security scanning and document any relevant findings.
- Evaluate remote Terraform state and state locking when an appropriate backend is available.

## Author

**Aden Ibrahim**

DevOps | Cloud Infrastructure | Terraform | Linux | AWS | CI/CD

GitHub: https://github.com/AdenTechLab
