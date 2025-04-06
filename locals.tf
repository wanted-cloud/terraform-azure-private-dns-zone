locals {
  definitions = {}
  soa_tags    = merge(local.metadata.default_tags, var.soa_record.tags)
}