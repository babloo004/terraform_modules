data "azurerm_virtual_machine" "az" {
    name = "ubuntu"
    resource_group_name = "ubuntu_group"
}

output "virtual_machine_id" {
    value = {
        id = data.azurerm_virtual_machine.az.id
        power_state = data.azurerm_virtual_machine.az.power_state
    } 
}