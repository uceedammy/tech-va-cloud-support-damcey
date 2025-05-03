terraform {
  backend "azurerm" {
    resource_group_name  = "damcey-terraform-rg"
    storage_account_name = "damceyterraformsa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
