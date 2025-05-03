resource "azurerm_container_group" "app" {
  name                = "damceyapp-${random_integer.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "damceyapp-${random_integer.suffix.result}"

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
