variable "resource_group_name" {
  description = "Name of the resource group for Terraform backend"
  type        = string
  default     = "cst8918-terraform-backend-rg"
}

variable "location" {
  description = "Azure region for the backend resources"
  type        = string
  default     = "canadacentral"
}

variable "storage_account_name" {
  description = "Name of the storage account for Terraform backend"
  type        = string
  default     = "cst8918tfstate"
}

variable "container_name" {
  description = "Name of the container for Terraform state files"
  type        = string
  default     = "tfstate"
}