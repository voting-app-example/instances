output "staging_ip" {
  description = "Staging ip."
  value       = module.staging.public_ip
}

output "production_ip" {
  description = "Production ip."
  value       = module.production.public_ip
}