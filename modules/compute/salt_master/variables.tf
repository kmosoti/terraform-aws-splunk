variable "project_name" {
  description = "A name to identify resources"
  type        = string
}

variable "salt_ami" {
  description = "AMI ID for the Salt Master"
  type        = string
  default     = "ami-0866a3c8686eaeeba"
}

variable "instance_type" {
  description = "EC2 instance type for Salt Master"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Private Subnet ID where Salt Master will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for Salt Master"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the existing EC2 Key Pair to use"
  type        = string
}
