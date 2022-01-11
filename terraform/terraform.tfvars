vpc_name= "Project-WEB"
eks_cluster_name= "Cluster-WEB"
eks_cluster_public= "true"
redis_cluster_name= "rediscluster"
vpc_cidr= "192.0.0.0/16"
private_subnets= ["192.0.1.0/24", "192.0.2.0/24", "192.0.3.0/24"]
public_subnets= ["192.0.16.0/24", "192.0.17.0/24", "192.0.18.0/24"]
redis_node_type= "cache.t2.small"
node_group_type= ["t3.small"]
aws_tags= {Name= "EKS-Cluster"}