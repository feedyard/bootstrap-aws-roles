# kops user role
resource "aws_iam_policy" "kops_role_policy" {
  provider = "aws.${var.aws_account}"
  name = "KopsRolePolicy"
  path = "/"
  policy = "${file("./policy-json/KopsRolePolicy.json")}"
}

resource "aws_iam_role" "kops_role" {
  provider = "aws.${var.aws_account}"
  name = "KopsRole"
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

resource "aws_iam_policy_attachment" "kops_role_attachment_to_kops_role_policy" {
  provider = "aws.${var.aws_account}"
  name = "kops_policy_attachment"
  roles = ["${aws_iam_role.kops_role.name}"]
  policy_arn = "${aws_iam_policy.kops_role_policy.arn}"
}
