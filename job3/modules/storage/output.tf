output "storage_account_name" {
    value = azurerm_storage_account.module.name
}

output "storage_account_key" {
    value = azurerm_storage_account.module.primary_access_key
}