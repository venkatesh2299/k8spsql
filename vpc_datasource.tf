data "aws_vpc" "ecs_vpc" {
    tags = {
        Name = "vpc-ecs-cluster"
    }
}

data "aws_subnets" "public_subnets" {
  tags = {
    Type = "ECSCluster-public-subnet"

  }
}

data "aws_subnets" "private_subnets" {
  tags = {
    Type = "ECSCluster-private-subnet"
  }
}