variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "damcey-terraform-rg"
}

variable "location" {
  description = "The location to deploy resources"
  type        = string
  default     = "eastus"
}

variable "ghcr_token" {
  description = "GitHub Container Registry Token"
  type        = string
}

variable "ghcr_image_url" {
  description = "The URL of the Docker image in GHCR"
  type        = string
}

variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
