provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-taskmanager-dev"
  location = var.location
  tags     = var.tags
}

module "networking" {
  source              = "../../modules/networking"
  vnet_name           = "vnet-taskmanager-dev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = var.tags
}

module "acr" {
  source                   = "../../modules/acr"
  acr_name                 = "acrtaskmanagerdev"
  resource_group_name      = azurerm_resource_group.rg.name
  location                = var.location
  geo_replication_location = "westus2"
  tags                    = var.tags
}

module "aks" {
  source              = "../../modules/aks"
  cluster_name        = "aks-taskmanager-dev"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = var.kubernetes_version
  subnet_id           = module.networking.aks_subnet_id
  acr_id              = module.acr.id
  tags                = var.tags
}