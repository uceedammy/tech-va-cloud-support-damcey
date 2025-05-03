variable "resource_group_name" {
  type        = string
  default     = "damcey-rg"
  description = "Resource Group name"
}

variable "location" {
  type        = string
  default     = "East US"
  description = "Azure region"
}

variable "storage_account_name" {
  type        = string
  default     = "damceystorageacct"
  description = "Storage Account name (must be globally unique)"
}
