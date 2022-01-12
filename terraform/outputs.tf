output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}



output "redis_hostname" {
  value = "${aws_elasticache_cluster.redis.cache_nodes.0.address}"
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "aws_auth_configmap_yaml" {
  description = "kubectl config as generated by the module."
  value       = module.eks.aws_auth_configmap_yaml
}

output "cluster_status" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value       = module.eks.cluster_status
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.eks_cluster_name
}

output "subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}