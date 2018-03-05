# backend.conf is setup at the start based on target account
terraform {
  required_version = ">= 0.11"

  backend "s3" {
  }
}

provider "aws" {
  version = "~> 1.10"
  region = "${var.aws_region}"
}

variable "profile_account_id" {}
variable "aws_region" { default = "us-east-1" }



