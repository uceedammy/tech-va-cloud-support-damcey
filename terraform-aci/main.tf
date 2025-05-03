resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_container_group" "app" {
  name                = "damceyapp-${random_integer.suffix.result}"
  location            = "eastus"
  resource_group_name = "damcey-rg"
  ip_address_type     = "Public"
  dns_name_label      = "damceyapp-${random_integer.suffix.result}"
  os_type             = "Linux"

  container {
    name   = "damceyapp"
    image  = "nginx:latest"
    cpu    = 1
    memory = 1.5

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}