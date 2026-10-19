# AWS Infrastructure with Terraform

Infrastructure as Code (IaC) project focused on AWS infrastructure design, Terraform automation, security best practices and cost awareness.

The project uses Terraform to define cloud infrastructure and GitHub Actions to automate configuration checks.

## Project Objectives

- Define AWS infrastructure using Terraform.
- Use reusable variables, resource tags and outputs.
- Validate Terraform configuration automatically with GitHub Actions.
- Apply security-first principles when designing cloud resources.
- Understand deployment planning, permissions and cost controls.

## Technology Stack

- **Cloud:** Amazon Web Services (AWS)
- **Infrastructure as Code:** Terraform
- **Version Control:** Git and GitHub
- **CI/CD:** GitHub Actions
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
│   └── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## Terraform Configuration

The Terraform configuration currently defines:

- AWS provider configuration for the London region (`eu-west-2`).
- Project and environment metadata.
- Common resource tags for project identification and management.
- Outputs for the project name, environment and AWS region.

The VPC and subnet design is a planned infrastructure milestone. These resources have not been successfully deployed because the current AWS account's Service Control Policy blocks the required EC2 networking permissions.

## Security and Cost Awareness

Security and cost control are important considerations throughout the project.

- Terraform state files and variable files are excluded from version control.
- AWS credentials are not stored in the repository.
- GitHub Actions uses read-only repository permissions for CI.
- Terraform plans are reviewed before any infrastructure deployment.
- AWS account permissions and service restrictions are checked before deployment.

## Continuous Integration

GitHub Actions automatically checks Terraform configuration when changes are pushed to the `main` branch or a pull request targets `main`.

The workflow performs:

1. Terraform formatting checks.
2. Terraform initialisation without configuring a remote backend.
3. Terraform configuration validation.

The workflow does not deploy AWS infrastructure or require AWS credentials.

## Validation

Run the following commands from the Terraform directory:

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
terraform plan
```

These commands check formatting, initialise the provider configuration, validate the Terraform files and preview the proposed changes.

## Current Status

- Terraform configuration and outputs implemented.
- GitHub repository and version control configured.
- GitHub Actions CI workflow passing.
- AWS infrastructure deployment blocked by an explicit AWS Organizations Service Control Policy.

No VPC or subnet has been successfully deployed by this project.

## Future Improvements

- Deploy the networking configuration in an AWS environment that permits the required permissions.
- Add a reviewed VPC and subnet configuration.
- Introduce automated security scanning for Terraform.
- Expand CI checks and documentation.
- Evaluate remote Terraform state and locking when an appropriate backend is available.

## Author

**Aden Ibrahim**

DevOps | Cloud Infrastructure | Terraform | Linux | AWS | CI/CD