###############################################
# Leafcloud Application Credential Outputs
###############################################

output "credential_id" {
  description = "The Key Vault secret ID containing the OpenStack credential ID"
  value       = azurerm_key_vault_secret.credential_id.id
  sensitive   = true
}

output "credential_secret" {
  description = "The Key Vault secret ID containing the OpenStack credential secret"
  value       = azurerm_key_vault_secret.credential_secret.id
  sensitive   = true
}

output "keyvault_id" {
  description = "The ID of the Key Vault where credentials are stored"
  value       = data.azurerm_key_vault.kv.id
}

output "openstack_credential_id" {
  description = "The OpenStack application credential ID"
  value       = openstack_identity_application_credential_v3.root_credential.id
  sensitive   = true
}
