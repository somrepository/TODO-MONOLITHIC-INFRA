data "azurerm_subnet" "subnet"  {
    for_each = var.nicv

    name = each.value.subnet
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
    for_each = var.nicv
    
    name = each.value.pip_name
    resource_group_name = each.value.resource_group_name
    
}

data "azurerm_key_vault" "kv" {
    for_each = var.lvmv
 
 name = each.value.name_kv
 resource_group_name = each.value.resource_group_name

  
}

data "azurerm_key_vault_secret" "azkeyv1" {
    for_each = var.lvmv

  name         = "azkeyv1"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}


data "azurerm_key_vault_secret" "azkeyv2" {
    for_each = var.lvmv

  name         = "azkeyv2"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

