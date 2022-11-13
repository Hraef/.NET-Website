resource "azurerm_resource_group" "webapp-rg" {
  name     = "webapp-rg"
  location = "Eastus2"
}

resource "azurerm_service_plan" "app-svp" {
  name                = "app-svp"
  resource_group_name = azurerm_resource_group.webapp-rg.name
  location            = azurerm_resource_group.webapp-rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "app0000234"
  resource_group_name = azurerm_resource_group.webapp-rg.name
  location            = azurerm_service_plan.app-svp.location
  service_plan_id     = azurerm_service_plan.app-svp.id

  site_config {
    always_on     = true
    http2_enabled = true
    application_stack {
      dotnet_version = "6.0"
    }
  }

}