output "vm_name" {
  value = google_compute_instance.cloudlab_vm.name
}

output "vm_external_ip" {
  value = google_compute_instance.cloudlab_vm.network_interface[0].access_config[0].nat_ip
}
