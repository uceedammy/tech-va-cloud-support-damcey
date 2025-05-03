provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "damcey-container-rg"
  location = "East US"
}

resource "random_integer" "rand" {
  min = 1000
  max = 9999
}

resource "azurerm_container_group" "app" {
  name                = "damceystaticapp-${random_integer.rand.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  container {
    name   = "staticapp"
    image  = "ghcr.io/uceedammy/damcey-static-app:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  image_registry_credential {
    server   = "ghcr.io"
    username = "uceedammy"
    password = var.ghcr_token
  }

  ip_address_type = "public"
  dns_name_label  = "damceyapp-${random_integer.rand.result}"
  ports {
    port     = 80
    protocol = "TCP"
  }
}
