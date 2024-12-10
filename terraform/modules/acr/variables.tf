variable "acr_name" {
  type        = string
  description = "Name of Azure Container Registry"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "geo_replication_location" {
  type        = string
  description = "Location for ACR geo-replication"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to ACR"
  default     = {}
}