variable "project_name" {
  description = "A name to identify resources"
  type        = string
}

variable "bastion_ami" {
  description = "AMI ID for the Bastion Host"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security Group ID for Bastion Host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Bastion Host"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "Public Subnet ID for Bastion Host"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the existing EC2 Key Pair to use"
  type        = string
}
