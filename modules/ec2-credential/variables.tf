variable "keyvault_name" {
  type        = string
  description = "(Required) The name of the Key Vault where credentials will be stored."
}

variable "keyvault_resource_group" {
  type        = string
  description = "(Required) The resource group name containing the Key Vault."
}

variable "ec2_credential_access_key_secret_name" {
  type        = string
  description = "(Required) The Key Vault secret name for storing the OpenStack EC2 credential Access key."
}

variable "ec2_credential_secret_secret_name" {
  type        = string
  description = "(Required) The Key Vault secret name for storing the OpenStack EC2 credential secret."
}
