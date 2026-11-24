locals {
  disk_names = {
    for key, disk in var.data_disks :
    key => "disk-${key}-${var.project_name}-${var.environment}-${var.location}"
  }

  common_tags = {
    project = var.project_name
    owner   = var.owner
  }
}