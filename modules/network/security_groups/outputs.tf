output "bastion_sg_id" {
  description = "The Security Group ID for the Bastion Host"
  value       = module.bastion_host_sg.bastion_sg_id
}
