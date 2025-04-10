variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
  default     = "canadacentral"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use"
  type        = string
  default     = "1.32"
}

variable "clusters" {
  description = "Configuration for AKS clusters"
  type = map(object({
    node_count    = number
    min_count     = optional(number)
    max_count     = optional(number)
    vm_size       = string
    subnet_id     = string
    environment   = string
  }))
}

variable "node_resource_group_name" {
  description = "Name of the resource group for node pools"
  type        = string
  default     = "cst8918-aks-nodes-rg"
}