
module "nsgm" {
  depends_on = [ module.rgsm ]
  source = "../../module/nsg"
  nsg    = var.nsgdev

}

module "pipm" {
  depends_on = [module.rgsm]
  source     = "../../module/azurerm_PIP"

  pip = var.pipdev

}

module "rgsm" {

  source = "../../module/azurerm_resource_group"
  rgs    = var.rgsdev
}


module "storage_accountm" {
  source = "../../module/azurerm_storage_account"

  stgv = var.stgdev

}



module "vnetworksm" {
  depends_on = [module.rgsm]

  source    = "../../module/azurerm_virtual_network"
  vnetworks = var.vnetworksdev
}







module "virtual-machinem" {
  depends_on = [ module.pipm ]
  source   = "../../module/azurerm_virtual_machine"
  subnetsv = var.subnetsvdev
  nicv     = var.nicvdev
  lvmv     = var.lvmvdev
}

module "mssql_dbm" {
  depends_on = [ module.rgsm, module.mssqlserverm ]
  source    = "../../module/azurerm_sql_database"
  mssql_dbv = var.mssql_dbvdev

}

module "mssqlserverm" {
  depends_on = [ module.rgsm ]
  source       = "../../module/azurerm_sql_server"
  mssql_server = var.mssql_serverdev

}





