output "cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.eks.name
}

output "node_group_name" {
  description = "EKS Node Group Name"
  value       = aws_eks_node_group.node_group.node_group_name
}

output "subnet_ids" {
  description = "Subnets used for the EKS Cluster"
  value       = local.supported_subnets
}
