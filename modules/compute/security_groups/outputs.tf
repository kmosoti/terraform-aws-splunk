output "bastion_sg_id" {
  description = "Security Group ID for Bastion Host"
  value       = aws_security_group.bastion_sg.id
}
