variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}



variable "location" {
  type        = string
  description = "Azure region for all resources"
  default     = "eastus2"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.31.1"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default = {
    Environment = "dev"
    Project     = "TaskManager"
    ManagedBy   = "Terraform"
  }
}

  variable "resource_group_name" {
  type        = string
  description = "Tfstate resource_group_name"
}

variable "storage_account_name" {
  type        = string
  description = "Tfstate Account Name"
}

variable "container_name" {
  type        = string
  description = "Tfstate Container Name"
}

variable "key" {
  type        = string
  description = "Tfstate Storage Key"
}