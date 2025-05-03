variable "ghcr_token" {}
variable "ghcr_image_url" {}
variable "resource_group_name" {
  default = "damcey-terraform-rg"
}
variable "location" {
  default = "eastus"
}
variable "dns_name_label" {
  default = "damceyapp-${replace(uuid(), "-", "")}"
}

resource "azurerm_container_group" "app" {
  name                = "damceyapp"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label

  container {
    name   = "damcey-app"
    image  = var.ghcr_image_url
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = "dev"
  }
}
