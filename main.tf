terraform {
  required_version = ">= 1.2.9"

  backend "s3" {
    bucket = "terraform-state-01010101"
    key    = "state/helloworld_state"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.AWS_REGION
}