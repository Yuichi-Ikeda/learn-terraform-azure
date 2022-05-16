terraform {
  required_version = ">=1.1"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_storage_account" "test" {
  name     = "${var.prefix}terrademost"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
}