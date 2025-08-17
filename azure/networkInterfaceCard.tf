//fetching subnet data (Required in further steps)
data "azurerm_subnet" "azsnd" {
    name = "back-end"
    virtual_network_name = azurerm_virtual_network.azvn.name
    resource_group_name = azurerm_resource_group.rg.name
}

//creating nic
resource "azurerm_network_interface" "aznic" {
    name = "terra-nic"
    location = resource.azurerm_resource_group.rg.location
    resource_group_name = resource.azurerm_resource_group.rg.name

    ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.azsnd.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pip.id
    }

    lifecycle {
      create_before_destroy = true
    }
}