provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.aws_region
  version    = "2.29"
}

terraform {
  required_version = "=0.12.9"
}
