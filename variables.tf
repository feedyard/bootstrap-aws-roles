# backend.conf is setup at the start based on target account
terraform {
  required_version = ">= 0.11"

  backend "s3" {
  }
}

# env passed via encrypted file
variable "aws_account" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

variable "profile_account_id" {}

