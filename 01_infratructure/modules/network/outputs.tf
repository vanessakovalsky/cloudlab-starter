output "network_name" {
  value = google_compute_network.cloudlab_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.cloudlab_subnet.name
}

output "firewall_name" {
  value = google_compute_firewall.cloudlab_firewall.name
}
