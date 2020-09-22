output "public_dns" {
  description = "Get public DNS names assigned to jenkins instance"
  value       = module.jenkinsec2.public_dns
}
output "public_ip" {
  description = "Get public IP names assigned to jenkins instance"
  value       = module.jenkinsec2.public_ip
}