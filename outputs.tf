output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = module.compute.bastion_public_ip
}
