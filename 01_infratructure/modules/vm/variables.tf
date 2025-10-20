variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

variable "vm_name" {
  type        = string
  default     = "cloudlab-vm"
  description = "Nom de la VM"
}

variable "vm_machine_type" {
  type    = string
  default = "e2-medium"
}

variable "gcp_service_account_email" {
  type        = string
  description = "Compte de service à attribuer à la VM"
  default     = ""
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "instance_tags" {
  type    = list(string)
  default = ["cloudlab", "web"]
}

variable "boot_image" {
  type    = string
  default = "debian-cloud/debian-12"
}

variable "boot_disk_size_gb" {
  type    = number
  default = 20
}

variable "startup_script" {
  type = string
  default = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y ca-certificates curl gnupg lsb-release
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
    apt-get update -y
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    systemctl enable docker
    systemctl start docker
  EOT
}
