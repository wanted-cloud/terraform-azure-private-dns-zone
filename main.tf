/**
 * # wanted-cloud/terraform-azure-private-dns-zone
 *
 * Terraform building block for creation and management of private DNS zone resources.
 *
 */
resource "azurerm_private_dns_zone" "this" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  soa_record {
    email        = var.soa_record.email
    expire_time  = var.soa_record.expire_time
    minimum_ttl  = var.soa_record.minimum_ttl
    refresh_time = var.soa_record.refresh_time
    retry_time   = var.soa_record.retry_time
    ttl          = var.soa_record.ttl
    tags         = local.soa_tags
  }
}
