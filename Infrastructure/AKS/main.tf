# Define the provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "aks_rg" {
  name     = "my-aks-resource-group"
  location = "East US"
}

# Create a virtual network
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "my-aks-vnet"
  address_space       = ["10.0.0.0/8"]
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

# Create a subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = "my-aks-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create an Azure Kubernetes Service (AKS) cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "myaksdns"

  # Define the default node pool
  default_node_pool {
    name       = "nodepool1"
    node_count = 2
    vm_size    = "Standard_DS2_v2"

    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  # Define Kubernetes version
  kubernetes_version = "1.27.3" # Replace with the desired Kubernetes version

  # Define service principal or managed identity
  identity {
    type = "SystemAssigned"
  }

  # Network profile configuration
  network_profile {
    network_plugin     = "azure"
    network_policy     = "calico"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  # Role-based Access Control (RBAC)
  role_based_access_control {
    enabled = true
  }

  # Configure the addon profile
  addon_profile {
    kube_dashboard {
      enabled = false # Set true to enable Kubernetes Dashboard
    }
  }

  tags = {
    environment = "development"
  }
}

# Output the AKS cluster details
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_url" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.host
}
