

output "resource_group_name" {
    value = azurerm_resource_group.test.name
}

output "storage_account_name" {
    value = azapi_resource.labaccount.name
}