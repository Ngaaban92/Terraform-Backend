# Terraform Block
terraform {
  backend "s3" {
    bucket  = "mytfbucket-tla-statefile001"
    dynamodb_table = "tla-state-lock"
    key     = "dev/tlastate001/tfstatefile.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}