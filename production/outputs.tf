output "ssh_private_key_secret_arn" {
  description = "Secrets Manager ARN where the SSH private key is stored"
  value       = aws_secretsmanager_secret.demo_ssh_key.arn
}

output "onprem_vpc_id" {
  description = "ID of the on-prem simulation VPC"
  value       = aws_vpc.onprem.id
}

output "production_vpc_id" {
  description = "ID of the production VPC"
  value       = aws_vpc.production.id
}

output "onprem_dc_public_ip" {
  description = "Public IP of the on-prem domain controller"
  value       = aws_instance.onprem_dc.public_ip
}

output "onprem_standalone_public_ip" {
  description = "Public IP of the on-prem standalone server"
  value       = aws_instance.onprem_standalone.public_ip
}

output "prod_dc_public_ip" {
  description = "Public IP of the production domain controller"
  value       = aws_instance.prod_dc.public_ip
}

output "prod_standalone_public_ip" {
  description = "Public IP of the production standalone server"
  value       = aws_instance.prod_standalone.public_ip
}
