resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                = "Premium"
  admin_enabled      = false

  georeplications {
    location                = var.geo_replication_location
    zone_redundancy_enabled = true
  }

  tags = var.tags
}