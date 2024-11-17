output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = module.bastion_host.public_ip
}
