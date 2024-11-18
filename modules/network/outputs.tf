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
  value       = module.security_groups.bastion_sg_id
}

output "salt_master_sg_id" {
  description = "The Security Group ID for Salt Master"
  value = module.security_groups.salt_master_sg_id
}
