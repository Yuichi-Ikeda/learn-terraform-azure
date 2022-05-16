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

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = var.location
}

module "storage" {
  source = "./modules/storage"
  prefixsub   = var.prefix
  location = var.location
  depends_on = [azurerm_resource_group.main]
}

resource "azurerm_service_plan" "main" {
  name                = "${var.prefix}-asp"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type = "Linux"
  sku_name = "Y1"
}

resource "azurerm_linux_function_app" "main" {
  name                       = "${var.prefix}-function"
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  service_plan_id            = azurerm_service_plan.main.id
  storage_account_name       = module.storage.storage_account_name
  storage_account_access_key = module.storage.storage_account_key
  site_config {}
}
