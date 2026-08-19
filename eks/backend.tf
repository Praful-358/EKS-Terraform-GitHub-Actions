terraform {
  required_version = "~> 1.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "jenkins-s3-eks-argo-bucket"
    region         = "ap-south-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "lock-files"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}
