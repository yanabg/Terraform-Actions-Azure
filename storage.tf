provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgs" {
  name     = "StorageRG"
  location = "North Europe"
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "taskboardstorageybg"
  resource_group_name      = azurerm_resource_group.rgs.name
  location                 = azurerm_resource_group.rgs.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "taskboardcontainer"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
