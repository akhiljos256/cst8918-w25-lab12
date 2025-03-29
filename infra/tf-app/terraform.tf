terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "040982662-githubactions-rg"
    storage_account_name = "sa040982662githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc            = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}
