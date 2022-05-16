# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
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

variable "prefix" {
  description = "The prefix used for all resources in this example"
}

resource "azurerm_resource_group" "test" {
  name     = "${var.prefix}-resources"
  location = "japaneast"
}

resource "azurerm_storage_account" "test" {
  name     = "${var.prefix}terrademost"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
}
