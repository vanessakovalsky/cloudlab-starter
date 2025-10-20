variable "project_id" {
  description = "ID du projet GCP"
  type        = string
}

variable "region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west1"
}

variable "gcp_zone" {
  description = "Zone GCP"
  type        = string
  default     = "europe-west1-b"
}

variable "vm_machine_type" {
  description = "Type de machine pour la VM"
  type        = string
  default     = "e2-medium"
}

variable "gcp_service_account_email" {
  description = "Email du compte de service à associer à la VM (ex: terraform@PROJECT.iam.gserviceaccount.com)"
  type        = string
  default     = ""
}
