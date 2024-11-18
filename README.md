
---

# **Terraform Splunk Environment Deployment**

![Terraform Logo](https://img.shields.io/badge/Terraform-v1.x-blue) ![AWS Logo](https://img.shields.io/badge/AWS-v5.75.1-orange) ![Splunk Logo](https://img.shields.io/badge/Splunk-Enabler-green) ![SaltStack Logo](https://img.shields.io/badge/SaltStack-Cloud-green)

Welcome to the **Terraform Splunk Environment Deployment** repository! This project automates the provisioning of a fully functional Splunk environment on AWS. It uses Terraform for infrastructure provisioning and Salt-Cloud for dynamic resource provisioning and configuration, ensuring a robust and scalable setup for observability and security.

---

## **To-Do List**

### **Infrastructure Setup**
- [x] Configure VPC with public and private subnets.
- [x] Set up Bastion Host for secure SSH access.
- [ ] **Create Terraform configuration for Salt Master:**
  - [ ] Deploy Salt Master in a **private subnet**.
  - [ ] Assign a **security group** with:
    - [ ] SSH access from the Bastion Host.
    - [ ] Necessary Salt communication ports (e.g., TCP 4505, 4506).
  - [ ] Ensure Salt Master is routable via SSH from the Bastion Host.

### **SaltStack Configuration**
- [ ] **Provision Splunk Salt Minions:**
  - [ ] Use Terraform to create a security group for Minions.
  - [ ] Pass the security group name to Salt Master’s configuration for inheritance by Minions.
  - [ ] Configure Salt Master files to provision Splunk components (Indexers, Forwarders).
- [ ] Write Salt states for:
  - [ ] Installing Splunk.
  - [ ] Configuring roles (Indexers, Forwarders).
  - [ ] Setting up networking and authentication for Splunk.

### **Integration and Scaling**
- [ ] Automate communication between Terraform and Salt-Cloud.
- [ ] Enable dynamic scaling for Splunk services.
- [ ] Add logs and metrics pipelines for Splunk observability.

### **QOL Stuff**
- [ ] Refactor for default_tags config block instead. Reduce repeated code like name tags and environment (prod,devtest) etc...

---

## **Features**
- **Terraform Infrastructure as Code (IaC)**:
  - VPC configuration with public and private subnets.
  - Security group definitions with fine-tuned access controls.
  - Bastion host deployment for administrative access.
- **Salt-Cloud Provisioning and Configuration**:
  - Instance provisioning within AWS using SaltStack.
  - Dynamic configuration management with Salt states.

---

---

## **Features**
- **Terraform Infrastructure as Code (IaC)**:
  - VPC configuration with public and private subnets.
  - Security group definitions with fine-tuned access controls.
  - Bastion host deployment for administrative access.
- **Salt-Cloud Provisioning and Configuration**:
  - Instance provisioning within AWS using SaltStack.
  - Dynamic configuration management with Salt states.

---

## **Getting Started**

### **Prerequisites**
1. [Terraform](https://www.terraform.io/) installed (version >= 1.x).
2. [SaltStack](https://docs.saltproject.io/) installed with Salt-Cloud.
3. AWS credentials configured locally (e.g., `~/.aws/credentials`).
4. A valid AWS Key Pair for EC2 access.
5. Permissions to manage AWS resources (IAM roles, VPC, EC2, Security Groups, etc.).

---

### **Repository Structure**
```plaintext
terraform-aws-splunk/
│
├── main.tf                # Top-level entry point
├── variables.tf           # Input variables
├── outputs.tf             # Project-level outputs
├── provider.tf            # AWS provider configuration
├── LICENSE                # License information
├── README.md              # Project documentation
├── .gitignore             # Git exclusions for sensitive files
│
├── modules/               # Reusable modules
│   ├── compute/           # Compute resources (e.g., EC2)
│   │   └── bastion_host/  # Bastion host configuration
│   └── network/           # Networking resources
│       ├── security_groups/ # Security group configurations
│       └── vpc/             # VPC, subnets, and routing
│
└── .terraform/            # Terraform state and cache (auto-generated, ignored by Git)
```

---

### **Configuring Input Variables**

Terraform variables can be defined in several ways:
1. **Directly in the `variables.tf` file**: This file declares variables that can be assigned values via the CLI or environment variables.
2. **Using `.tfvars` files (local use only)**: Since `.tfvars` files are ignored by Git (see `.gitignore`), they are a secure way to store sensitive data locally without risking exposure in version control. An example `terraform.tfvars` file might look like this:

   ```plaintext
   project_name         = "splunk-environment"
   vpc_cidr             = "10.0.0.0/16"
   public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
   private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
   your_ip              = "203.0.113.1/32"
   bastion_ami          = "ami-0c02fb55956c7d316"
   instance_type        = "t3.micro"
   key_pair_name        = "your-key-pair-name"
   ```

   > **Note**: These files are local to your environment and should not be committed to version control.

3. **Command-line input**: Pass variables directly when running Terraform commands:
   ```bash
   terraform apply -var="project_name=splunk-environment" -var="vpc_cidr=10.0.0.0/16"
   ```

---

### **Sensitive Files and Exclusions**

The `.gitignore` file is configured to exclude:
- `.tfvars` files: These often contain sensitive data like passwords, private keys, or API keys and should remain local.
- `.terraform` directory: Stores Terraform's local state and provider plugins, which can be regenerated.
- `*.tfstate` files: Contains the current state of your infrastructure and may include sensitive information.
- Private keys (`*.pem`): Ensure that sensitive credentials are not accidentally added to version control.

> For collaboration, provide a `variables.tf` file with descriptions of required variables so others can configure their environment securely.

---

## **How to Use**

#### **Step 1: Deploy Infrastructure with Terraform**
1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Validate the configuration:
   ```bash
   terraform validate
   ```
3. Plan the infrastructure:
   ```bash
   terraform plan
   ```
4. Deploy the resources:
   ```bash
   terraform apply
   ```

#### **Step 2: Provision and Configure Resources with Salt-Cloud**
Refer to the **Salt-Cloud Setup** section for configuring and deploying AWS resources dynamically.

---

### **Future Enhancements**
1. Automate Splunk installation and configuration with Salt states.
2. Extend the setup to deploy Splunk forwarders and indexers.
3. Add integration pipelines for logs and metrics ingestion.
4. Scale infrastructure dynamically based on workload.

---

## **Resources**
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [SaltStack Documentation](https://docs.saltproject.io/)

---

## **License**
This project is licensed under the [MIT License](LICENSE).

---