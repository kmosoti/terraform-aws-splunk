variable "project_name" {
  description = "A name to identify resources"
  type        = string
  default     = "splunk-network-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "your_ip" {
  description = "Your public IP for SSH access (in CIDR notation)"
  type        = string
}

variable "bastion_ami" {
  description = "AMI ID for the Bastion Host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Bastion Host"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the existing EC2 Key Pair to use"
  type        = string
}
