
resource "azurerm_resource_group" "test" {
  name     = "${var.prefix}-resources"
  location = var.location
}

# Provision a Lab Service Account and a Lab that are in public preview
resource "azapi_resource" "labaccount" {
  type      = "Microsoft.LabServices/labaccounts@2018-10-15"
  name      = "${var.prefix}LabAccount"
  parent_id = azurerm_resource_group.test.id

  body = jsonencode({
    properties = {
      enabledRegionSelection = false
    }
  })
}

resource "azapi_resource" "lab" {
  type      = "Microsoft.LabServices/labaccounts/labs@2018-10-15"
  name      = "${var.prefix}Lab"
  parent_id = azapi_resource.labaccount.id

  body = jsonencode({
    properties = {
      maxUsersInLab  = 10
      userAccessMode = "Restricted"
    }
  })
}