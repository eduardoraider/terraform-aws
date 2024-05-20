terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "bucket_name"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}


