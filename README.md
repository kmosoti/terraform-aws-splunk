
---

# **Terraform Splunk Environment Deployment**

![Terraform Logo](https://img.shields.io/badge/Terraform-v1.x-blue) ![AWS Logo](https://img.shields.io/badge/AWS-v5.75.1-orange) ![Splunk Logo](https://img.shields.io/badge/Splunk-Enabler-green) ![SaltStack Logo](https://img.shields.io/badge/SaltStack-Cloud-green)

Welcome to the **Terraform Splunk Environment Deployment** repository! This project automates the provisioning of a fully functional Splunk environment on AWS. It uses Terraform for infrastructure provisioning and Salt-Cloud for dynamic resource provisioning and configuration, ensuring a robust and scalable setup for observability and security.

---

## **To-Do List**

### **Infrastructure Setup**
- [x] Configure VPC with public and private subnets.
- [x] Set up Bastion Host for secure SSH access.
- [x] **Create Terraform configuration for Salt Master:**
  - [x] Deploy Salt Master in a **private subnet**.
  - [x] Assign a **security group** with:
    - [x] SSH access from the Bastion Host.
    - [x] Necessary Salt communication ports (e.g., TCP 4505, 4506).

### **SaltStack Configuration**
- [ ] **Provision Splunk Salt Minions:**
  - [x] Use Terraform to create a security group for Minions.
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


## **Features**
- **Terraform Infrastructure as Code (IaC)**:
  - VPC configuration with public and private subnets.
  - Security group definitions with fine-tuned access controls.
  - Bastion host deployment for administrative access.
- **Salt-Cloud Provisioning and Configuration**:
  - Instance provisioning within AWS using SaltStack.
  - Dynamic configuration management with Salt states.

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

## **Getting Started**

### **Prerequisites**
1. [Terraform](https://www.terraform.io/) installed (version >= 1.x).
2. [SaltStack](https://docs.saltproject.io/) installed with Salt-Cloud.
3. AWS credentials configured locally (e.g., `~/.aws/credentials`).
4. A valid AWS Key Pair for EC2 access.
5. Permissions to manage AWS resources (IAM roles, VPC, EC2, Security Groups, etc.).

### **Setting Up AWS CLI**

1. **Install AWS CLI:**
   - Follow the [official AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) for your operating system.

2. **Configure AWS CLI with Access Keys:**
   - Open your terminal or command prompt.
   - Run the following command and enter your AWS Access Key ID, Secret Access Key, default region, and output format when prompted:
     ```bash
     aws configure
     ```
   - This will set up your AWS credentials in `~/.aws/credentials` and configuration in `~/.aws/config`.

### **Connecting to the Bastion Host**

1. **Retrieve Bastion Host Public IP:**
   - After deploying the infrastructure with Terraform, note the Bastion Host's public IP from the Terraform output.

2. **Connect via SSH:**
   - Use the following command to SSH into the Bastion Host:
     ```bash
     ssh -i /path/to/your/key-pair.pem ec2-user@<bastion_public_ip>
     ```
   - **Replace:**
     - `/path/to/your/key-pair.pem` with the path to your AWS Key Pair `.pem` file.
     - `<bastion_public_ip>` with the actual public IP address of your Bastion Host.

### **Connecting to the Salt Master**

1. **SSH from Bastion Host to Salt Master:**
   - Once connected to the Bastion Host, use SSH to access the Salt Master using its private IP:
     ```bash
     ssh -i /path/to/your/key-pair.pem ec2-user@<salt_master_private_ip>
     ```
   - **Replace:**
     - `<salt_master_private_ip>` with the Salt Master's private IP address from the Terraform output.

2. **Verify Salt Master Connection:**
   - Ensure that you can run Salt commands and that the Salt Master is operational:
     ```bash
     sudo systemctl status salt-master
     ```
   - You should see that the Salt Master service is **active** and **running**.

---

### **Example Workflow:**

1. **Initialize and Apply Terraform Configuration:**
   ```bash
   terraform init
   terraform apply
   ```
   - Review and confirm the changes when prompted.

2. **Set Up AWS CLI:**
   ```bash
   aws configure
   ```
   - Enter your AWS credentials and preferred settings.

3. **Connect to Bastion Host:**
   ```bash
   ssh -i ~/keys/my-key-pair.pem ec2-user@54.123.45.67
   ```
   - Replace the path and IP with your actual key pair location and Bastion Host IP.

4. **Connect to Salt Master from Bastion Host:**
   ```bash
   ssh -i ~/keys/my-key-pair.pem ec2-user@10.0.3.45
   ```
   - Replace the IP with your Salt Master's private IP.

5. **Verify Salt Master Status:**
   ```bash
   sudo systemctl status salt-master
   ```
   - Ensure the service is running as expected.

---

### **Tips:**

- **SSH Key Permissions:**
  - Ensure your `.pem` file has the correct permissions to be used by SSH:
    ```bash
    chmod 400 /path/to/your/key-pair.pem
    ```

- **SSH Config (Optional):**
  - To simplify SSH commands, consider configuring your `~/.ssh/config` file:
    ```plaintext
    Host bastion
        HostName <bastion_public_ip>
        User ec2-user
        IdentityFile /path/to/your/key-pair.pem

    Host salt-master
        HostName <salt_master_private_ip>
        User ec2-user
        IdentityFile /path/to/your/key-pair.pem
        ProxyJump bastion
    ```
  - This allows you to connect to the Salt Master using:
    ```bash
    ssh salt-master
    ```

- **Ensure Scripts Have Correct Line Endings:**
  - If you're on Windows, ensure your `salt_master_bootstrap_install.sh` script uses Unix-style line endings (LF) to prevent execution issues on Linux instances.
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