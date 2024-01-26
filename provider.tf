terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAVRUVUDOTALFMQHJO"
  secret_key = "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"
}
