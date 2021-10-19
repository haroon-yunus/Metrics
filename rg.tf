resource "azurerm_resource_group" "main" {
  name     = var.rg
  location = var.location
}

resource "azurerm_storage_account" "to_monitor" {
  name                     = var.storageaccnt
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}