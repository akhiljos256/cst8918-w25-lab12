# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "040982662-a12-rg"
  location = "canadacentral"
  tags     = var.tags
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "040982662-a12-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "040982662-a12-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
