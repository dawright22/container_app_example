terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.44.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}


provider "azurerm" {
  features {}
}

variable "location" {
  default     = "Australia East"
  description = "Location of the resource group."
}

resource "random_pet" "name" {
  prefix = "tft"
  length = 1
}

resource "azurerm_resource_group" "tft" {
  name     = "${random_pet.name.id}-resources"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "tft" {
  name                = "${random_pet.name.id}-acctest"
  location            = azurerm_resource_group.tft.location
  resource_group_name = azurerm_resource_group.tft.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "tft" {
  name                       = "${random_pet.name.id}-Environment"
  location                   = azurerm_resource_group.tft.location
  resource_group_name        = azurerm_resource_group.tft.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.tft.id
}
resource "azurerm_container_app" "tft" {
  name                         = "${random_pet.name.id}-app"
  container_app_environment_id = azurerm_container_app_environment.tft.id
  resource_group_name          = azurerm_resource_group.tft.name
  revision_mode                = "Multiple"

  template {
    container {
      name   = "${random_pet.name.id}-containerapp"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
    external_enabled           = true
    target_port                = "80"
    transport                  = "auto"
    traffic_weight {
       label = "${random_pet.name.id}-rev1"
       latest_revision = true
      percentage ="100"
    }
  }
}

output "app-connect" {
  value = "https://${azurerm_container_app.tft.ingress[0].fqdn}"
}