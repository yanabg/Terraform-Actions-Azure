resource "azurerm_client_config" "current" {}

resource "azurerm_azuread_service_principal" "sp" {
  application_id = azurerm_client_config.current.client_id
}

resource "azurerm_role_assignment" "role" {
  principal_id = azurerm_azuread_service_principal.sp.object_id
  role_definition_name = "Contributor"
  scope = "/subscriptions/86db3548-5854-4928-be1e-0d991fad3ef9"
}
