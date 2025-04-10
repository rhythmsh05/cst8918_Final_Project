output "storage_account_name" {
  description = "Name of the storage account created for Terraform backend"
  value       = azurerm_storage_account.backend.name
}

output "container_name" {
  description = "Name of the container created for Terraform state files"
  value       = azurerm_storage_container.backend.name
}

output "resource_group_name" {
  description = "Name of the resource group containing backend resources"
  value       = azurerm_resource_group.backend.name
}