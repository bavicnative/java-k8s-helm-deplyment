# Data source for Azure Key Vault
data "azurerm_key_vault" "pythonwebapp_aks" {
  name                = "pythonwebapp-aks"
  resource_group_name = "your-keyvault-resource-group" # Replace with actual resource group name
}

# Secrets from Azure Key Vault
data "azurerm_key_vault_secret" "subscription_id" {
  name         = "subscription-id"
  key_vault_id = data.azurerm_key_vault.pythonwebapp_aks.id
}

data "azurerm_key_vault_secret" "client_id" {
  name         = "client-id"
  key_vault_id = data.azurerm_key_vault.pythonwebapp_aks.id
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = "client-secret"
  key_vault_id = data.azurerm_key_vault.pythonwebapp_aks.id
}

data "azurerm_key_vault_secret" "tenant_id" {
  name         = "tenant-id"
  key_vault_id = data.azurerm_key_vault.pythonwebapp_aks.id
}
