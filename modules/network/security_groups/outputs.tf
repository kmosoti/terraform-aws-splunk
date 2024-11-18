output "bastion_sg_id" {
  description = "The Security Group ID for the Bastion Host"
  value       = module.bastion_host_sg.bastion_sg_id
}

output "salt_master_sg_id" {
  description = "The Security Group ID for the Bastion Host"
  value       = module.salt_master_sg.salt_master_sg_id
}
