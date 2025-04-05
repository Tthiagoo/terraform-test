terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::211125601738:role/TerraformCloudRole"
  }
}