variable "resource_group_name" {
  type    = string
  default = "damcey-terraform-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "storage_account_name" {
  type    = string
  default = "damceyterraformsa"
  # Storage account names must be globally unique and use only lowercase letters and numbers (3–24 chars)
}

variable "container_name" {
  type    = string
  default = "tfstate"
}
