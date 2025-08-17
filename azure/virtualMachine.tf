resource "azurerm_virtual_machine" "azvm" {
    name = "Terra-vm"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    network_interface_ids = [azurerm_network_interface.aznic.id]
    vm_size = "Standard_D2s_v3"

    storage_image_reference {
      publisher = "Canonical"
      offer = "ubuntu-24_04-lts"
      sku = "server"
      version = "latest"
    }

    storage_os_disk {
      name = "myosdisk1"
      caching = "ReadWrite"
      create_option = "FromImage"
      managed_disk_type = "Standard_LRS"
    }

    os_profile {
      computer_name = "terra-vm"
      admin_username = "username"
      admin_password = "password"
    }

    os_profile_linux_config {
      disable_password_authentication = false
    }

    tags = {
      testing = "true"
    }
}

//attaching disk
resource "azurerm_virtual_machine_data_disk_attachment" "azdska" {
    managed_disk_id = azurerm_managed_disk.azdk.id
    virtual_machine_id = azurerm_virtual_machine.azvm.id
    lun = "10"
    caching = "ReadWrite"

}
