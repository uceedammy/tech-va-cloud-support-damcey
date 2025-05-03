# variables.tf

variable "ghcr_token" {
  description = "GitHub Container Registry token"
  type        = string
}

variable "ghcr_image_url" {
  description = "The URL of the Docker image in GHCR"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "container_group_name" {
  description = "Name of the Azure Container Group"
  type        = string
  default     = "damceyapp"
}
