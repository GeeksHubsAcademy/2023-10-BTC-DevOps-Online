data "aws_iam_group" "alumnos_group" {
  group_name = "devOps2310"
}

data "aws_iam_policy" "ec2_full_access" {
  name = "AmazonEC2FullAccess"
}

data "aws_iam_policy" "ssm_full_access" {
  name = "AmazonSSMFullAccess"
}

data "aws_iam_policy" "ec2_instance_connect" {
  name = "EC2InstanceConnect"
}

data "aws_iam_policy" "change_password" {
  name = "IAMUserChangePassword"
}