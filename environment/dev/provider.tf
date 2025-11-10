terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.52.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
    features {}

    subscription_id = "dbc44e07-0c52-4013-97e5-e416090c2bea"
  
}