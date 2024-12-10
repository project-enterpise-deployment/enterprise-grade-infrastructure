variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes to use"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for AKS"
}

variable "acr_id" {
  type        = string
  description = "ACR ID for pulling images"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}