# AWS Infrastructure with Terraform

An Infrastructure as Code (IaC) portfolio project focused on AWS infrastructure design, Terraform automation, automated testing, security best practices and cost awareness.

This project uses Terraform to provision AWS networking and security resources, while GitHub Actions automates formatting, validation, testing and infrastructure security scanning.

## Project Objectives

- Define and manage AWS infrastructure using Terraform.
- Build AWS networking resources using Infrastructure as Code.
- Use variables, outputs and consistent resource-tagging conventions.
- Apply security-first principles to infrastructure design.
- Automate Terraform quality checks through GitHub Actions.
- Test infrastructure configuration and scan for security misconfigurations.
- Understand cloud permissions, deployment planning and cost controls.

## Technology Stack

- **Cloud:** Amazon Web Services (AWS)
- **Infrastructure as Code:** Terraform
- **Networking:** Amazon VPC, Subnets, Internet Gateway and Route Tables
- **Identity and Access Management:** AWS IAM
- **Logging and Encryption:** Amazon CloudWatch, VPC Flow Logs and AWS KMS
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

## AWS Infrastructure

The infrastructure is deployed in the **Europe (Stockholm) region (`eu-north-1`)**.

| Resource | Configuration |
|---|---|
| Amazon VPC | `10.0.0.0/16` |
| Public subnet | `10.0.1.0/24` in `eu-north-1a` |
| Internet Gateway | Attached to the VPC |
| Route table | Default route to the Internet Gateway |
| Default security group | Inbound and outbound rules restricted |
| CloudWatch log group | VPC Flow Logs with 365-day retention |
| AWS KMS | Dedicated encryption key with automatic rotation |
| IAM role and policy | Scoped permissions for VPC Flow Logs |
| VPC Flow Logs | Configured to capture all VPC traffic |

The subnet has automatic public IP assignment disabled. Although its route table includes a route to the Internet Gateway, resources in the subnet do not automatically receive public IP addresses.

The application security group was removed because no application compute resource is currently deployed.

## Security and Cost Awareness

Security is integrated into the infrastructure configuration and automated workflow.

- Terraform state files and sensitive variable files are excluded from version control.
- AWS credentials are not stored in the repository.
- GitHub Actions runs configuration validation and tests without requiring AWS credentials.
- Checkov scans Terraform resources for potential security misconfigurations.
- VPC Flow Logs use a dedicated KMS key with automatic rotation enabled.
- CloudWatch log retention is configured for 365 days.
- IAM permissions for flow logging are scoped to the required operations.
- The default security group is configured without inbound or outbound rules.
- AWS permissions and organisational restrictions are considered before infrastructure changes.
- Resource usage and ongoing AWS charges are reviewed as part of cost awareness.

**Cost consideration:** KMS keys, CloudWatch log ingestion and log storage may incur charges. Actual costs depend on usage and applicable AWS pricing.

## Continuous Integration

GitHub Actions automates infrastructure quality and security checks when changes are pushed or pull requests target the `main` branch.

The workflow includes:

1. Terraform formatting checks.
2. Terraform initialisation without configuring a remote backend.
3. Terraform configuration validation.
4. Automated Terraform tests.
5. Checkov infrastructure security scanning.

### Latest reported verification

| Check | Result |
|---|---|
| Terraform formatting | Passed |
| Terraform validation | Passed |
| Terraform tests | Passed |
| Checkov security scan | 27 passed, 0 failed |
| GitHub Actions | All green, as last reported |

These checks verify the configuration and automated security controls. They do not, by themselves, prove that a fresh deployment will succeed or that live AWS resources match the latest configuration.

## Validation

Run the following commands from the repository root:

```bash
terraform -chdir=terraform fmt -check
terraform -chdir=terraform init -backend=false
terraform -chdir=terraform validate
terraform -chdir=terraform test
checkov --directory terraform --framework terraform
```

To preview infrastructure changes when valid AWS credentials are available:

```bash
terraform -chdir=terraform plan
```

Always review the plan before applying changes. Planning and deployment may require AWS credentials and appropriate permissions.

## Current Status

- AWS networking infrastructure deployed through Terraform.
- VPC, subnet, Internet Gateway and route table configured.
- Default security group hardened.
- VPC Flow Logs configured with KMS encryption and automatic key rotation.
- CloudWatch log retention configured for one year.
- IAM permissions for VPC Flow Logs scoped to the required operations.
- Automated Terraform tests implemented.
- GitHub Actions CI pipeline
