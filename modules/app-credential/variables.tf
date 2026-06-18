###############################################
# Leafcloud Application Credential Variables
###############################################

variable "keyvault_name" {
  type        = string
  description = "(Required) The name of the Key Vault where credentials will be stored."
}

variable "keyvault_resource_group" {
  type        = string
  description = "(Required) The resource group name containing the Key Vault."
}

variable "root_identity_name" {
  type        = string
  description = "(Required) The name of the OpenStack application credential."
}

variable "root_identity_id_secret_name" {
  type        = string
  description = "(Required) The Key Vault secret name for storing the OpenStack credential ID."
}

variable "root_identity_secret_secret_name" {
  type        = string
  description = "(Required) The Key Vault secret name for storing the OpenStack credential secret."
}
