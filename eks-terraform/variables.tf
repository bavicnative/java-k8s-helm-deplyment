variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  default     = "my-eks-cluster"
}

variable "node_group_name" {
  description = "Node Group Name"
  default     = "sample-app-nodegroup"
}

variable "instance_types" {
  description = "Instance types for the EKS Node Group"
  default     = ["t3.medium"]
}

variable "scaling_config" {
  description = "Scaling configuration for the EKS Node Group"
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
  default = {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the default VPC"
  default     = "0.0.0.0/0"
}
