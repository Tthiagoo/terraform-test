terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}
provider "aws" {
  alias  = "global"
  region = "us-east-1"
}