output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.main_vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the Public Subnets"
  value       = module.main_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the Private Subnets"
  value       = module.main_vpc.private_subnet_ids
}

output "bastion_sg_id" {
  description = "The Security Group ID for the Bastion Host"
  value       = module.bastion_host_sg.bastion_sg_id
}
