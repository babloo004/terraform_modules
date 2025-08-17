resource "azurerm_network_security_group" "aznsg" {
    name = "terra-nsg"
    location = resource.azurerm_resource_group.rg.location
    resource_group_name = resource.azurerm_resource_group.rg.name

    security_rule {
        name = "ssh"
        priority = "100"
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name = "allowOutbound"
        priority = "100"
        direction = "Outbound"
        access = "Allow"
        protocol = "*"
        source_port_range = "*"
        destination_port_range = "*"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    lifecycle {
      create_before_destroy = true
    }
}