output "storage_account_name" {
  value = azurerm_storage_account.tf_sa.name
}

output "container_name" {
  value = azurerm_storage_container.tf_container.name
}

output "resource_group_name" {
  value = azurerm_resource_group.tf_rg.name
}
