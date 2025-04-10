/**
 * # wanted-cloud/terraform-azure-private-dns-zone
 *
 * Terraform building block for creation and management of private DNS zone resources.
 *
 */
resource "azurerm_private_dns_zone" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  dynamic "soa_record" {
    for_each = var.soa_record != null ? [1] : []
    content {
      email        = var.soa_record.email
      expire_time  = var.soa_record.expire_time
      minimum_ttl  = var.soa_record.minimum_ttl
      refresh_time = var.soa_record.refresh_time
      retry_time   = var.soa_record.retry_time
      ttl          = var.soa_record.ttl
      tags         = merge(local.metadata.tags, var.soa_record.tags)
    }
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_private_dns_zone"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}
