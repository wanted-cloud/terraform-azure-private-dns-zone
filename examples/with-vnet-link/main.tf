data "azurerm_virtual_network" "example" {
  name                = "gl-vnet-test-001"
  resource_group_name = "test"
}

module "example" {
    source = "../.."
    
    name = "example.com"
    resource_group_name = "example-rg"

    virtual_network_links = [{
      name = "example-vnet-link"
      virtual_network_id = data.azurerm_virtual_network.example.id
      registration_enabled = true
      tags = {
        Purpose = "Global"
      }
    }]
}