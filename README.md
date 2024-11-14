# Terraform AWS Network Modules

![Terraform](https://img.shields.io/badge/Terraform-0.13%2B-blue.svg)
![AWS](https://img.shields.io/badge/AWS-Enabled-orange.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## Table of Contents

- [📖 Introduction](#-introduction)
- [🚀 Features](#-features)
- [📦 Modules](#-modules)
- [🔧 Requirements](#-requirements)
- [🛠️ Usage](#️-usage)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Configure Variables](#2-configure-variables)
  - [3. Initialize Terraform](#3-initialize-terraform)
  - [4. Plan the Deployment](#4-plan-the-deployment)
  - [5. Apply the Configuration](#5-apply-the-configuration)
- [🗂️ Variables](#️-variables)
- [🔑 Outputs](#-outputs)
- [📚 Examples](#-examples)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)
- [📧 Contact](#-contact)

---

## 📖 Introduction

Welcome to the **Terraform AWS Network Modules** repository! This collection of Terraform modules is designed to simplify and standardize the creation and management of AWS networking infrastructure. Whether you're setting up a new project or enhancing an existing one, these modules provide a robust foundation for your Virtual Private Cloud (VPC) configurations.

---

## 🚀 Features

- **Modular Design:** Reusable and scalable Terraform modules for AWS networking components.
- **VPC Configuration:** Customizable VPC setup with public and private subnets.
- **Security Groups:** Pre-configured security groups for enhanced security.
- **Internet Gateway:** Seamless integration with AWS Internet Gateway for public access.
- **No Elastic IPs:** Streamlined setup without the need for Elastic IPs, adhering to your specifications.
- **Extensible:** Easily extendable to include additional networking components as needed.

---

## 📦 Modules

This repository currently includes the following modules:

1. **VPC Module (`modules/vpc`)**
   - **Description:** Creates an AWS VPC with public and private subnets, Internet Gateway, and Route Tables.
   - **Submodules:**
     - **Private Network (VPC)**
     - **Firewall (Security Groups)**
     - **Subnets**
     - **Internet Gateway**
     - **Route Tables**
     - **Bastion Host**

---

## 🔧 Requirements

Before using these modules, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) **>= 0.13**
- [AWS CLI](https://aws.amazon.com/cli/) **configured with appropriate credentials**
- [Git](https://git-scm.com/downloads) **for cloning the repository**

---

## 🛠️ Usage

Follow these steps to integrate the VPC module into your Terraform project.

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/terraform-aws-network-modules.git
cd terraform-aws-network-modules
```

### 2. Configure Variables

Create a `terraform.tfvars` file in the root directory with your desired configurations. An example is provided below.

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` to suit your environment:

```hcl
# terraform.tfvars

# Project Identification
project_name = "my-network-project"

# VPC Configuration
vpc_cidr = "10.0.0.0/16"

# Public Subnets Configuration
public_subnet_cidrs = [
  "10.0.1.0/24",  # Public Subnet 1
  "10.0.2.0/24"   # Public Subnet 2
]

# Private Subnets Configuration
private_subnet_cidrs = [
  "10.0.101.0/24",  # Private Subnet 1
  "10.0.102.0/24"   # Private Subnet 2
]
```

### 3. Initialize Terraform

Initialize the Terraform working directory to download necessary providers and modules.

```bash
terraform init
```

### 4. Plan the Deployment

Review the infrastructure changes Terraform will make.

```bash
terraform plan
```

### 5. Apply the Configuration

Deploy the infrastructure as defined in your configuration.

```bash
terraform apply
```

Type `yes` when prompted to proceed.

---

## 🗂️ Variables

Define and customize your infrastructure using the following variables.

| Variable Name          | Description                                     | Type       | Default           |
| ---------------------- | ----------------------------------------------- | ---------- | ----------------- |
| `project_name`         | A name to identify resources                    | `string`   | `"my-network-project"` |
| `vpc_cidr`             | CIDR block for the VPC                          | `string`   | `"10.0.0.0/16"`   |
| `public_subnet_cidrs`  | List of CIDR blocks for public subnets           | `list(string)` | `["10.0.1.0/24", "10.0.2.0/24"]` |
| `private_subnet_cidrs` | List of CIDR blocks for private subnets          | `list(string)` | `["10.0.101.0/24", "10.0.102.0/24"]` |

*Add more variables as needed based on your module configurations.*

---

## 🔑 Outputs

Access essential information about your infrastructure through these outputs.

| Output Name          | Description                     |
| -------------------- | ------------------------------- |
| `vpc_id`             | The ID of the created VPC        |
| `public_subnet_ids`  | List of Public Subnet IDs        |
| `private_subnet_ids` | List of Private Subnet IDs       |
| `internet_gateway_id`| The ID of the Internet Gateway   |
| `public_route_table_id` | The ID of the Public Route Table |
| `private_route_table_id` | The ID of the Private Route Table |

*Outputs can be extended based on additional resources.*

---

## 📚 Examples

### Basic Usage

Here's a basic example of how to use the VPC module in your Terraform project.

```hcl
module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
```

### Advanced Usage

For more advanced configurations, including integrating the Bastion Host or additional security settings, refer to the [examples](./examples) directory.

---

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute to this repository, please follow these steps:

1. **Fork the Repository**

2. **Create a Feature Branch**

   ```bash
   git checkout -b feature/YourFeatureName
   ```

3. **Commit Your Changes**

   ```bash
   git commit -m "Add Your Feature"
   ```

4. **Push to the Branch**

   ```bash
   git push origin feature/YourFeatureName
   ```

5. **Open a Pull Request**

Please ensure your code adheres to the project's coding standards and includes relevant tests.

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

---

## 📧 Contact

For any inquiries or support, please contact:

- **Name:** Your Name
- **Email:** your.email@example.com
- **LinkedIn:** [Your LinkedIn Profile](https://www.linkedin.com/in/yourprofile)
- **GitHub:** [Your GitHub Username](https://github.com/yourusername)

---

## 💡 Tips & Best Practices

- **Version Control:** Always use version control for your Terraform configurations to track changes and collaborate effectively.
- **State Management:** Consider using remote backends like AWS S3 with DynamoDB for state locking to manage your Terraform state securely.
- **Security:** Avoid hardcoding sensitive information. Use Terraform's [sensitive variables](https://www.terraform.io/language/values/variables#sensitive-variables) or AWS Secrets Manager for managing secrets.
- **Documentation:** Keep your `README.md` and inline code comments updated to reflect the current state of your infrastructure.
- **Testing:** Use tools like [Terratest](https://terratest.gruntwork.io/) to automate the testing of your Terraform modules.

---
