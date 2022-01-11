module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.0.5"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = var.eks_cluster_public
  cluster_name    = var.eks_cluster_name
  cluster_version = "1.21"
  subnet_ids      = module.vpc.public_subnets

   cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }
  
  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = "BOTTLEROCKET_x86_64"
    disk_size              = 10
    instance_types         = ["t3a.small", "m5.large", "m5n.large"]
    vpc_security_group_ids = [aws_security_group.mgmt_access.id]
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 4
      desired_size = 1

      instance_types = var.node_group_type
      labels = {
        Cluster = var.eks_cluster_name
      }
      taints = {
        dedicated = {
          key    = "dedicated"
          value  = "gpuGroup"
          effect = "NO_SCHEDULE"
        }
      }
    }
  }
}
