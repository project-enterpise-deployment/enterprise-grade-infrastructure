# First create VNet
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["172.16.0.0/16"]  # Using a completely different range
  tags                = var.tags
}

# Create AKS subnet after VNet is ready
resource "azurerm_subnet" "aks" {
  name                 = "snet-aks"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["172.16.1.0/24"]  # Subnet within VNet range

  lifecycle {
    create_before_destroy = true
  }
}

# Create ingress subnet after VNet is ready
resource "azurerm_subnet" "ingress" {
  name                 = "snet-ingress"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["172.16.2.0/24"]  # Subnet within VNet range

  lifecycle {
    create_before_destroy = true
  }
}