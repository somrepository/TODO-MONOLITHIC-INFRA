# resource "azurerm_bastion_host" "bastion" {
#     for_each = var.bastionv

#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   ip_configuration {
#     name                 = each.value.name_ipconfiguration
#     subnet_id            = azurerm_subnet.example.id
#     public_ip_address_id = azurerm_public_ip.example.id
#   }
# }