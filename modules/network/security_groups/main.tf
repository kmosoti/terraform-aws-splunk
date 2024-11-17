module "bastion_host_sg" {
  source = "./bastion_host_sg"

  project_name      = var.project_name
  your_ip = var.your_ip
  vpc_id = var.vpc_id
}
