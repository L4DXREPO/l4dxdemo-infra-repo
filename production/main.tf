locals {
  common_tags = {
    Environment = "demo"
    ManagedBy   = "terraform"
  }
}

resource "tls_private_key" "demo" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "demo" {
  key_name   = "mgn-demo-key"
  public_key = tls_private_key.demo.public_key_openssh

  tags = local.common_tags
}

resource "aws_secretsmanager_secret" "demo_ssh_key" {
  name                    = "mgn-demo/ssh-private-key"
  description             = "Private key for mgn-demo EC2 instances"
  recovery_window_in_days = 0

  tags = local.common_tags
}

resource "aws_secretsmanager_secret_version" "demo_ssh_key" {
  secret_id     = aws_secretsmanager_secret.demo_ssh_key.id
  secret_string = tls_private_key.demo.private_key_openssh
}
