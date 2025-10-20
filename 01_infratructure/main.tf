# Appel du module network
module "network" {
  source     = "./modules/network"
  project_id = var.project_id
  region     = var.region
  # cidr range peut être hardcodé ou exposé si tu veux
}

# Appel du module vm, dépend explicitement des outputs du module network
module "vm" {
  source                     = "./modules/vm"
  project_id                 = var.project_id
  region                     = var.region
  gcp_zone                   = var.gcp_zone
  vm_machine_type            = var.vm_machine_type
  gcp_service_account_email  = var.gcp_service_account_email

  network_name = module.network.network_name
  subnet_name  = module.network.subnet_name
}
