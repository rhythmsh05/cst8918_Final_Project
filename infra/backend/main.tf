terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_resource_group" "backend" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = "Backend"
    Project     = "CST8918 Final Project"
  }
}

resource "azurerm_storage_account" "backend" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = "Backend"
    Project     = "CST8918 Final Project"
  }
}

resource "azurerm_storage_container" "backend" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}