variable "keyvault" {
  type = object({
    name           = string
    resource_group = string
  })
  description = "The Azure Keyvault configuration"
}

variable "root_identity" {
  type = object({
    name               = string
    secret_name_id     = string
    secret_name_secret = string
  })
  description = "The Root Identity configuration."
}
