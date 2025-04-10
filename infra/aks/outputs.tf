output "cluster_ids" {
  description = "Map of cluster names to their IDs"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.id }
}

output "kube_config" {
  description = "Map of cluster names to their kubeconfig"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kube_config_raw }
  sensitive   = true
}

output "cluster_identities" {
  description = "Map of cluster names to their managed identities"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.identity[0].principal_id }
}