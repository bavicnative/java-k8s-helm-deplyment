variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "my-aks-resource-group"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "my-aks-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "my-aks-subnet"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "my-aks-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for the Kubernetes cluster"
  type        = string
  default     = "myaksdns"
}

variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
  default     = "nodepool1"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.30.1"
}

variable "service_cidr" {
  description = "Service CIDR for the Kubernetes cluster"
  type        = string
  default     = "10.1.0.0/16"
}

variable "dns_service_ip" {
  description = "DNS Service IP for the Kubernetes cluster"
  type        = string
  default     = "10.1.0.10"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    environment = "development"
  }
}
