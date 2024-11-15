output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "List of Public Subnet IDs"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of Private Subnet IDs"
  value       = module.network.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.network.internet_gateway_id
}

output "public_route_table_id" {
  description = "The ID of the Public Route Table"
  value       = module.network.public_route_table_id
}

output "private_route_table_id" {
  description = "The ID of the Private Route Table"
  value       = module.network.private_route_table_id
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = module.compute.bastion_public_ip
}
