variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "environment" {
  description = "Environment name, e.g. prod."
  type        = string
}

variable "owner" {
  description = "Owner tag value."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "southafricanorth"

  validation {
    condition     = var.location == "southafricanorth"
    error_message = "Location must be southafricanorth."
  }
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "virtual_machine_ids" {
  description = "Map of VM IDs, keyed by VM key. Use the vm_ids output of the VM module."
  type        = map(string)
}

variable "data_disks" {
  description = "Map of data disks. The key is used in the disk name, and vm_key picks which VM the disk attaches to."
  type = map(object({
    vm_key               = string
    lun                  = number
    disk_size_gb         = optional(number, 1)
    storage_account_type = optional(string, "Standard_LRS")
    caching              = optional(string, "ReadWrite")
  }))
  default = {}
}