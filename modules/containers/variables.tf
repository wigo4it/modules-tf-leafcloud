variable "containers" {
  type        = list(string)
  description = "(Required) List of containers to create in the Leafcloud Object Store."
  default     = []
}

variable "region" {
  type        = string
  description = "(Required) The Leafcloud region where resources will be deployed."
  default     = "europe-nl"
}
