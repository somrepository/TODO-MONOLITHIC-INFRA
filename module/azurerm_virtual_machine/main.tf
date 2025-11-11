
resource "azurerm_network_interface" "nic" {
  for_each = var.nicv

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "lvm" {
  for_each = var.lvmv

  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.azkeyv1[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.azkeyv2[each.key].value
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids           = [azurerm_network_interface.nic["nic1"].id]

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}
