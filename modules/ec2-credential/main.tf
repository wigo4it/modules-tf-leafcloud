#############################################
# Leafcloud EC2 Credential Module
#############################################
# This module creates EC2 Credential to access S3 compatible endpoints (e.g. Object Store)

# Get the Key Vault reference
data "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_resource_group
}

#############################################
# Create EC2 Credential
#############################################
resource "openstack_identity_ec2_credential_v3" "ec2_key" {} # provider arguments are used

#############################################
# Store credentials in Azure Key Vault
#############################################
# Store EC2 credential access key
resource "azurerm_key_vault_secret" "ec2_access_key" {
  name            = var.ec2_credential_access_key_secret_name
  value           = openstack_identity_ec2_credential_v3.ec2_key.access
  key_vault_id    = data.azurerm_key_vault.kv.id
  expiration_date = timeadd(timestamp(), "1440h") # 60 days
}

# Store EC2 credential secret
resource "azurerm_key_vault_secret" "ec2_secret" {
  name            = var.ec2_credential_secret_secret_name
  value           = openstack_identity_ec2_credential_v3.ec2_key.secret
  key_vault_id    = data.azurerm_key_vault.kv.id
  expiration_date = timeadd(timestamp(), "1440h") # 60 days
}
