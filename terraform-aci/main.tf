# main.tf

provider "azurerm" {
  features {}
}

# Random ID resource to generate a suffix for the DNS name
resource "random_id" "suffix" {
  byte_length = 8
}

# Define the Azure Container Group resource
resource "azurerm_container_group" "app" {
  name                = "${var.container_group_name}-${random_id.suffix.hex}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "${var.container_group_name}-${random_id.suffix.hex}"

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

# Output the DNS name of the deployed container
output "container_app_url" {
  value = azurerm_container_group.app.fqdn
}
