variable "mssql_dbv" {
  type = map(object({

    server_name         = string
    resource_group_name = string
    mssql_db_name       = string
    collation           = optional(string)
    license_type        = optional(string)
    max_size_gb         = optional(number)
    sku_name            = optional(string)
    enclave_type        = optional(string)
    tags                = optional(map(string))
  }))
}

