#############################################
# 🌐 Fichier : network.tf
# Objectif : Créer un réseau VPC et un sous-réseau GCP
# Projet : CloudLab Starter / Pro
#############################################

# --- Réseau principal (VPC)
resource "google_compute_network" "cloudlab_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
  description             = var.description
}

# --- Sous-réseau principal
resource "google_compute_subnetwork" "cloudlab_subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.cloudlab_network.id
  ip_cidr_range = var.ip_cidr_range
  description   = "Sous-réseau principal pour le projet CloudLab"
}

# --- Pare-feu : autoriser SSH, HTTP et HTTPS
resource "google_compute_firewall" "cloudlab_firewall" {
  name    = "${var.network_name}-allow-ssh-http"
  network = google_compute_network.cloudlab_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = var.allowed_source_ranges
  target_tags   = var.target_tags
  description   = "Règles firewall de base pour le projet CloudLab"
}
