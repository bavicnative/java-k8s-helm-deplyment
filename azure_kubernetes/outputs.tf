output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_url" {
  value = try(azurerm_kubernetes_cluster.aks.kube_admin_config[0].host, "Kube admin config not available")
}
