terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "hannierg" {
   name     = "diamond-rg"
   location = "UK South"
 }

 resource "azurerm_virtual_network" "myvnet" {
   name                = "diamond-vnet"
   address_space       = ["10.0.0.0/16"]
   location            = azurerm_resource_group.hannierg.location
   resource_group_name = azurerm_resource_group.hannierg.name
 }
 resource "azurerm_subnet" "harnniersubnet" {
   name                 = "diamond-sub"
   resource_group_name  = azurerm_resource_group.hannierg.name
   virtual_network_name = azurerm_virtual_network.hannievnet.name
   address_prefixes     = ["10.0.2.0/24"]
 }