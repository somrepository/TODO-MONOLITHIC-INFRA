output "rg_ids" {
  value = { for k, v in azurerm_resource_group.rgs : k => v.id }
}

output "rg_name" {
  value = {for k, v in azurerm_resource_group.rgs : k => v.name
}
}
output "rg_location" {
  value = {for k, v in azurerm_resource_group.rgs : k => v.location}
  }





  output "azurerm_resource_group_name" {

    value = azurerm_resource_group.rgs.name

  }

output "azurerm_resource_group_location" {

  value = azurerm_resource_group.rgs.location
  
}

