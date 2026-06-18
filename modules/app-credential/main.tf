# This module creates OpenStack application credentials and stores them in Azure Key Vault

# Get the Key Vault reference
data "azurerm_key_vault" "kv" {
  name                = var.keyvault.name
  resource_group_name = var.keyvault.resource_group
}

# Create OpenStack Application Credential
resource "openstack_identity_application_credential_v3" "root_credential" {
  name         = var.root_identity.name
  description  = "Used to create resources and rotate password"
  unrestricted = true
}

# Store application credential ID in Azure Key Vault
resource "azurerm_key_vault_secret" "credential_id" {
  name            = var.root_identity.secret_name_id
  value           = openstack_identity_application_credential_v3.root_credential.id
  key_vault_id    = data.azurerm_key_vault.kv.id
  expiration_date = timeadd(timestamp(), "1440h") # 60 days
}

# Store application credential secret in Azure Key Vault
resource "azurerm_key_vault_secret" "credential_secret" {
  name            = var.root_identity.secret_name_secret
  value           = openstack_identity_application_credential_v3.root_credential.secret
  key_vault_id    = data.azurerm_key_vault.kv.id
  expiration_date = timeadd(timestamp(), "1440h") # 60 days
}
