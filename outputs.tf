output "disk_ids" {
  description = "Map of managed disk IDs, keyed by the names in data_disks."
  value       = { for key, disk in azurerm_managed_disk.this : key => disk.id }
}

output "disk_names" {
  description = "Map of managed disk names, keyed by the names in data_disks."
  value       = { for key, disk in azurerm_managed_disk.this : key => disk.name }
}