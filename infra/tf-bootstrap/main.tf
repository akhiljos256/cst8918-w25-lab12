# Create resource group for Terraform backend
resource "azurerm_resource_group" "backend" {
  name     = "040982662-githubactions-rg"
  location = "canadacentral"
  tags = {
    Environment = "Production"
    Purpose     = "Terraform Backend"
    Project     = "CST8918-Lab12"
  }
}

# Create storage account for Terraform backend
resource "azurerm_storage_account" "backend" {
  name                     = "sa040982662githubactions"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version         = "TLS1_2"

  tags = {
    Environment = "Production"
    Purpose     = "Terraform Backend"
    Project     = "CST8918-Lab12"
  }
}

# Create container for Terraform state
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}
