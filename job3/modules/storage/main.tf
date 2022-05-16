resource "azurerm_storage_account" "module" {
  name     = "${var.prefixsub}gggstorage"
  resource_group_name      =  "${var.prefixsub}-resources"
  location = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
}