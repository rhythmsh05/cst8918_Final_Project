terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.clusters

  name                = "aks-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${each.key}"
  kubernetes_version  = var.kubernetes_version

  node_resource_group = "${var.node_resource_group_name}-${each.key}"

  default_node_pool {
    name                = "default"
    node_count          = each.value.node_count
    vm_size             = each.value.vm_size
    vnet_subnet_id      = each.value.subnet_id
    enable_auto_scaling = each.value.max_count != null ? true : false
    min_count           = each.value.min_count
    max_count           = each.value.max_count
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = {
    Environment = each.value.environment
    Project     = "CST8918 Final Project"
  }
}