resource "azurerm_virtual_network" "azvn" {
    name = "terra-vn"
    location = resource.azurerm_resource_group.rg.location
    resource_group_name = resource.azurerm_resource_group.rg.name
    address_space = ["192.48.0.0/16"]

    subnet {
        name = "front-end"
        address_prefixes = ["192.48.1.0/24"]
    }

    subnet {
        name = "back-end"
        address_prefixes = ["192.48.2.0/24"]
        security_group = azurerm_network_security_group.aznsg.id
    }

    tags = {
        purpose = "Testing"
    }

    lifecycle {
      create_before_destroy = true
    }
}

