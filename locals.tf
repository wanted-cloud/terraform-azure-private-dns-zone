locals {
  // This definition must remain here to keep module metadata working
  module_metadata = {}
  // Here you can add your own local definitions
  soa_tags = merge(local.metadata.default_tags, var.soa_record.tags)
}