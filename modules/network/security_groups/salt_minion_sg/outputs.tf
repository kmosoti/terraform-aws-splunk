output "salt_minion_sg_id" {
  description = "Security Group ID for Bastion Host"
  value       = aws_security_group.salt_minion_sg.id
}
