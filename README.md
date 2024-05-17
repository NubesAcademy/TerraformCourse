# Mastering Terraform: from Zero to HashiCorp Certified 2024

Welcome to the GitHub repository for the "Mastering Terraform: from Zero to HashiCorp Certified 2024" educational video course. This project contains the Terraform configuration files used throughout the course, designed to help you achieve HashiCorp Terraform certification.

## Course Overview

This course provides comprehensive coverage of Terraform, from basic concepts to advanced topics, preparing you for the HashiCorp Terraform certification. You will learn how to manage infrastructure as code using Terraform, with practical examples and hands-on exercises.

### Enroll in the Course

To enroll in the course and gain access to all the video lessons and materials, visit: [Mastering Terraform: from Zero to HashiCorp Certified 2024](https://pototskyy.net/mastering-terraform-from-zero-to-hashicorp-certified/)

### Introduction Video

Watch the introduction video on YouTube to get an overview of what you will learn in this course: [Introduction to Mastering Terraform](https://youtu.be/bbrPc9JOjsA)

## Getting Started

To get started with this project, follow the steps below to clone the repository, initialize Terraform, and manage your infrastructure.

### Clone the Repository

```bash
git clone https://github.com/oleksiy-pototskyy/mastering-terraform-from-zero-to-certified-professional.git
cd mastering-terraform-from-zero-to-certified-professional
```

### Initialize Terraform

Before you begin, you need to initialize your Terraform working directory.

```bash
terraform init
```

### Plan and Deploy

You can create an execution plan to see what changes will be made to your infrastructure. Use the appropriate variables file for your environment (dev or prod).

#### Development Environment

```bash
terraform plan -var-file=env-dev.tfvars
terraform apply -var-file=env-dev.tfvars
```

#### Production Environment

```bash
terraform plan -var-file=env-prod.tfvars
terraform apply -var-file=env-prod.tfvars
```

### Destroy

To destroy the infrastructure managed by Terraform, use the `destroy` command with the appropriate variables file.

#### Development Environment

```bash
terraform destroy -var-file=env-dev.tfvars
```

#### Production Environment

```bash
terraform destroy -var-file=env-prod.tfvars
```

## Course Content

This repository includes configuration files and scripts that will help you understand and implement various Terraform concepts covered in the course. By following along with the course videos, you'll learn how to:

- Set up and configure Terraform
- Write and manage Terraform configuration files
- Use variables and outputs
- Manage different environments (dev and prod)
- Apply best practices for Terraform usage
- Prepare for the HashiCorp Terraform certification exam

## Support

For any questions or support related to the course, feel free to reach out via the course platform or open an issue in this repository.

Happy learning and happy automating!

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
