variable "project_name" {
  description = "A name to identify resources"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "your_ip" {
  description = "Your public IP for SSH access (in CIDR notation)"
  type        = string
}
