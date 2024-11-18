output "salt_master_sg_id" {
  description = "Security Group ID for Bastion Host"
  value       = aws_security_group.salt_master_sg.id
}
