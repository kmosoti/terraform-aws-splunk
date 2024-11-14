terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "terraform-files-kmosoti"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
