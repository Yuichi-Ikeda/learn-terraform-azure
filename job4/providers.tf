terraform {
  required_version = ">=1.1"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "=0.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
  default_location = var.location
  default_tags = {
    team = "Azure deployments"
  }
}
