terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"

  backend "azurerm" {
    resource_group_name  = "040982662-githubactions-rg"
    storage_account_name = "040982662githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }
}
