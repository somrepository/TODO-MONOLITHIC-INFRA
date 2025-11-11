variable "subnetsv" {
  type = map(object({
    name                 = string
    virtual_network_name = string
    resource_group_name  = string
  }))
}

variable "nicv" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet               = string
    pip_name             = string
    virtual_network_name = string
    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })

  }))
}

variable "lvmv" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    size                            = string
    disable_password_authentication = bool

    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    name_kv = string
  }))
}
