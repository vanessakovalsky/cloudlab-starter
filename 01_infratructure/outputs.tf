output "network_name" {
  description = "Nom du réseau VPC"
  value       = module.network.network_name
}

output "subnet_name" {
  description = "Nom du sous-reseau"
  value       = module.network.subnet_name
}

output "vm_name" {
  description = "Nom de la VM"
  value       = module.vm.vm_name
}

output "vm_external_ip" {
  description = "IP publique de la VM"
  value       = module.vm.vm_external_ip
}
