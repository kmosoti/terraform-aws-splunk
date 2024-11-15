output "bastion_sg_id" {
  description = "Security Group ID for Bastion Host"
  value       = module.security_groups.bastion_sg_id
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = module.bastion_host.public_ip
}
