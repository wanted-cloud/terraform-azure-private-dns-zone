output "private_dns_zone" {
  description = "The private DNS zone"
  value       = azurerm_private_dns_zone.this
}

output "private_dns_zone_virtual_network_links" {
  description = "List of the private DNS zone virtual network links"
  value       = azurerm_private_dns_zone_virtual_network_link.this
}