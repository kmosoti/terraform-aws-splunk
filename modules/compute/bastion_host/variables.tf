variable "project_name" {
  description = "A name to identify resources"
  type        = string
}

variable "bastion_ami" {
  description = "AMI ID for the Bastion Host"
  type        = string
  default     = "ami-0866a3c8686eaeeba"
}

variable "instance_type" {
  description = "EC2 instance type for Bastion Host"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Public Subnet ID where Bastion Host will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for Bastion Host"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the existing EC2 Key Pair to use"
  type        = string
}
