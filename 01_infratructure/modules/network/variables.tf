variable "project_id" {
  type        = string
  description = "Project id"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "network_name" {
  type        = string
  description = "Nom du réseau"
  default     = "cloudlab-vpc"
}

variable "subnet_name" {
  type        = string
  description = "Nom du sous-réseau"
  default     = "cloudlab-subnet"
}

variable "ip_cidr_range" {
  type        = string
  description = "CIDR pour le sous-réseau"
  default     = "10.0.0.0/24"
}

variable "description" {
  type    = string
  default = "VPC for CloudLab"
}

variable "allowed_source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "target_tags" {
  type    = list(string)
  default = ["cloudlab"]
}
