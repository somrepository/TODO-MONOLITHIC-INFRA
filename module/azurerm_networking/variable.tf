variable "networks" {
  type = map(object({

    name                   = string
    azurerm_resource_group = string
    location               = string
    address_space          = string
    tags                   = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = string
    })))
  }))
}
