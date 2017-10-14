# state files for x-account assume role configuration maintained in profile account
# the ~/.aws/credentials file is populated at deployment runtime with the profile information
//terraform {
//  required_version = ">= 0.10.6"
//
//  backend "s3" {
//    bucket  = "feedyard-sandbox-local"
//    key     = "boostrap-sandbox-roles/auth.tfstate"
//    region  = "us-east-1"
//    profile = "bootstrap-sandbox"
//  }
//}

terraform {
  required_version = ">= 0.10.6"

  backend "s3" {
  }
}

# env passed via encrypted file
variable "aws_account" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

variable "profile_account_id" {}

