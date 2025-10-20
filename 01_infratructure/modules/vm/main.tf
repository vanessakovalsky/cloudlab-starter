##############################################
# CloudLab Starter - VM Instance (Terraform)
##############################################

resource "google_compute_instance" "cloudlab_vm" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.gcp_zone

  tags = var.instance_tags

  # 🖥️ Image Debian avec Docker installé automatiquement
  boot_disk {
    initialize_params {
      image = var.boot_image
      size  = var.boot_disk_size_gb
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name

    access_config {} # Permet d'obtenir une IP publique
  }

  metadata_startup_script = var.startup_script

  metadata = {
    ssh-keys = "terraform:${file("~/.ssh/id_rsa.pub")}"
  }

  service_account {
    email  = var.gcp_service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}