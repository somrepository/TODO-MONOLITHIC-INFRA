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

networksdev = {

  network1 = {
    name                = "vnet1-yuvraj"
    location            = "centralindia"
    resource_group_name = "yuvi_rg"
    address_space       = ["10.0.0.1/16"]
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
        address_prefixes = ["10.0.2.0/24"]
      }
    ]

  }
}
