resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = { for link in var.virtual_network_links : link.name => link }

  name                  = each.value.name != "" ? each.value.name : azurerm_private_dns_zone.this.name
  resource_group_name   = azurerm_private_dns_zone.this.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = each.value.virtual_network_id
  registration_enabled  = each.value.registration_enabled
  tags                  = merge(local.metadata.tags, each.value.tags)

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone_virtual_network_link"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone_virtual_network_link"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone_virtual_network_link"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone_virtual_network_link"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}