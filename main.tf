# role policies for aws account: sandbox
provider "aws" {
  alias = "${var.aws_account}"
  region = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

# terraform user role
resource "aws_iam_policy" "terraform_role_policy" {
  provider = "aws.${var.aws_account}"
  name = "TerraformRolePolicy"
  path = "/"
  policy = "${file("./policy-json/TerraformRolePolicy.json")}"
}

resource "aws_iam_role" "terraform_role" {
  provider = "aws.${var.aws_account}"
  name = "TerraformRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": { "AWS": "arn:aws:iam::${var.profile_account_id}:root" },
    "Action": "sts:AssumeRole"
  }
}
EOF
}

# attach policy to role
resource "aws_iam_policy_attachment" "terraform_role_attachment_to_terraform_role_policy" {
  provider = "aws.${var.aws_account}"
  name = "terraform_policy_attachment"
  roles = ["${aws_iam_role.terraform_role.name}"]
  policy_arn = "${aws_iam_policy.terraform_role_policy.arn}"
}
