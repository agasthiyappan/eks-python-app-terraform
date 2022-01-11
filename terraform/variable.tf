variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "vpc_name" {
  type = string
  default = "my-vpc"
}

variable "eks_cluster_name" {
  type = string
  default = "my-cluster"
}

variable "eks_cluster_public" {
  type = string
  default = "false"
}

variable "k8s_cluster_type" {
  description = "Can be set to `vanilla` or `eks`. If set to `eks`, the Kubernetes cluster will be assumed to be run on EKS which will make sure that the AWS IAM Service integration works as supposed to."
  type        = string
  default     = "vanilla"
}

variable "k8s_namespace" {
  description = "Kubernetes namespace to deploy the AWS ALB Ingress Controller into."
  type        = string
  default     = "default"
}

variable "aws_vpc_id" {
  description = "ID of the Virtual Private Network to utilize. Can be ommited if targeting EKS."
  type        = string
  default     = null
}

variable "vpc_cidr" {
  type = string
  default = "192.0.0.0/16"
}

variable "private_subnets" {
  type = list(string)
  default = ["192.0.1.0/24", "192.0.2.0/24", "192.0.3.0/24"]
}

variable "public_subnets" {
  type = list(string)
  default = ["192.0.16.0/24", "192.0.17.0/24", "192.0.18.0/24"]
}

variable "aws_tags" {
  type        = map(string)
  default     = {}
}

variable "aws_alb_ingress_controller_version" {
  type        = string
  default     = "2.3.0"
}

variable "redis_cluster_name" {
  type = string
  default = "my-redis"
}

variable "redis_node_type" {
  type = string
  default = "cache.t2.small"
}

variable "redis_engine_version" {
  type = string
  default = "6.x"
}

variable "redis_maintenance_window" {
  default = "sun:05:00-sun:06:00"
}

variable "node_group_type" {
  type = list(string)
  default = ["t3.small"]
}

