resource "azurerm_public_ip" "pip" {
    name = "terra-ip"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"

    tags = {
      testing = "true"
    }
}