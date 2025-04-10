variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "cst8918-final-project-group-5"
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
  default     = "canadacentral"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "cst8918-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = string
  default     = "10.0.0.0/14"
}

variable "subnet_configs" {
  description = "Configuration for each subnet"
  type = map(object({
    address_prefix = string
  }))
  default = {
    prod = {
      address_prefix = "10.0.0.0/16"
    }
    test = {
      address_prefix = "10.1.0.0/16"
    }
    dev = {
      address_prefix = "10.2.0.0/16"
    }
    admin = {
      address_prefix = "10.3.0.0/16"
    }
  }
}