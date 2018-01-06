# role policies for target aws account
provider "aws" {
  alias = "${var.aws_account}"
  region = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

# for each role policy added create a new .tf file with a descriptive name
