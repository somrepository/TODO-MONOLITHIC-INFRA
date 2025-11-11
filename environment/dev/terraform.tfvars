rgsdev = {

  rg1 = {

    name       = "yuvi_rg"
    location   = "centralindia"
    managed_by = "terrform"
    tags = {

      env = "dev"
    }

  }
}

vnetworksdev = {

  network1 = {
    name                = "vnet-yuvraj"
    resource_group_name = "yuvi_rg"
    location            = "centralindia"

    address_space = ["10.0.0.1/16"]
    tags = {
      env = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.0.2/24"]
      }
    ]

  }
}

subnetsvdev = {
  subnet1 = {
    name                 = "frontend-subnet"
    virtual_network_name = "vnet-yuvraj"
    resource_group_name  = "yuvi_rg"
  }
}

nicvdev = {
  nic1 = {
    name                 = "nic1"
    virtual_network_name = "vnet-yuvraj"
    location             = "Central India"
    resource_group_name  = "yuvi_rg"
    pip_name             = "pip1"
    subnet               = "frontend-subnet"
    ip_configuration = {
      name                          = "nic1-config"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

lvmvdev = {
  vm1 = {
    name                            = "frontend-vm"
    resource_group_name             = "yuvi_rg"
    location                        = "Central India"
    size                            = "Standard_B1s"
    disable_password_authentication = false

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
    name_kv = "yuvi-secret"
  }
}


pipdev = {
  publicip1 = {
    name                = "frontend-public-ip"
    resource_group_name = "yuvi_rg"
    location            = "centralindia"
    allocattion_method  = "Static"
    tags = {
      env = "prod"
    }
  }
}

mssql_serverdev = {
  sqlserver1 = {
    mssql_server_name            = "mssqlserver"
    resource_group_name          = "yuvi_rg"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "Welcome@1234"
    minimum_tls_version          = "1.2"
    tags = {
      env = "dev"
    }
  }

}

mssql_dbvdev = {
  mssql_database1 = {

    server_name         = "yuvimssqlserver"
    resource_group_name = "yuvi_rg"
    mssql_db_name       = "yuvidatabase"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
    tags = {
      env = "dev"
    }
  }
}



nsgdev = {
  nsg1 = {
    name                = "yuvi-nsg"
    location            = "centralindia"
    resource_group_name = "yuvi_rg"
    tags = {
      environment = "Dev"

    }
    security_rule = [
      {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

stgdev = {
  storage1 = {
    name                     = "yuvistorage1"
    resource_group_name      = "yuvi_rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

