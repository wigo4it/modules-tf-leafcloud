#############################################
# Leafcloud Application Credential Module
#############################################
# This module creates OpenStack application credentials and stores them in Azure Key Vault

# Get the Key Vault reference
data "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_resource_group
}

#############################################
# Create OpenStack Application Credential
#############################################
resource "openstack_identity_application_credential_v3" "root_credential" {
  name         = var.root_identity_name
  description  = "Used to create resources and rotate password"
  unrestricted = true
  provider     = openstack.leafcloud
}

#############################################
# Store credentials in Azure Key Vault
#############################################
# Store application credential ID
resource "azurerm_key_vault_secret" "credential_id" {
  name            = var.root_identity_id_secret_name
  value           = openstack_identity_application_credential_v3.root_credential.id
  key_vault_id    = data.azurerm_key_vault.kv.id
  expiration_date = timeadd(timestamp(), "1440h") # 60 days
}

# Store application credential secret
resource "azurerm_key_vault_secret" "credential_secret" {
  name            = var.root_identity_secret_secret_name
  value           = openstack_identity_application_credential_v3.root_credential.secret
  key_vault_id    = data.azurerm_key_vault.kv.id
  expiration_date = timeadd(timestamp(), "1440h") # 60 days
}
