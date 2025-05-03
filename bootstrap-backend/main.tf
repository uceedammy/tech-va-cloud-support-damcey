terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"  # Or specify the version you need, but it must be 2.0 or higher
    }
  }
}

provider "azurerm" {
  features {}

  # Optional: Specify a subscription ID if needed.  If omitted, it will use the default context.
  # subscription_id = "your-subscription-id"
}

resource "azurerm_resource_group" "tf_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "tf_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tf_rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "tf_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tf_sa.name
  container_access_type = "private"
}