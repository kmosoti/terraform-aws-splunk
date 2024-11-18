variable "project_name" {
  description = "A name to identify resources"
  type        = string
}

variable "vpc_id" {
  description = "ID to project VPC"
  type = string
}

variable "bastion_sg_id" {
  description = "ID of bastion host security group to enable ssh routing"
}

variable "salt_master_sg_id" {
  description = "ID of salt master security group to enable ssh routing and salt connectivity"
}