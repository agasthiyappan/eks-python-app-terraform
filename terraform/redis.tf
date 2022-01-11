resource "aws_security_group" "redis" {
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
	  "172.0.0.0/16",
      "192.0.0.0/16",
    ]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_subnet_group" "default" {
  name        = "subnet-group-${var.eks_cluster_name}"
  description = "Private subnets for the ElastiCache instances: ${var.eks_cluster_name}"
  subnet_ids  = module.vpc.private_subnets
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${var.redis_cluster_name}"
  engine               = "redis"
  engine_version       = "${var.redis_engine_version}"
  maintenance_window   = "${var.redis_maintenance_window}"
  node_type            = "${var.redis_node_type}"
  num_cache_nodes      = "1"
  parameter_group_name = "default.redis6.x"
  port                 = "6379"
  subnet_group_name    = "${aws_elasticache_subnet_group.default.name}"
  security_group_ids   = ["${aws_security_group.redis.id}"]

}