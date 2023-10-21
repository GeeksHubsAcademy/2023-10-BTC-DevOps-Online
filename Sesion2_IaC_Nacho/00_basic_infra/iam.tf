data "aws_iam_policy_document" "terraform_operator" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "s3:ListAllMyBuckets",
      "s3:ListBucket"
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/terraform_state_locking-devops-dev"
    ]
  }
}

data "aws_iam_policy_document" "manage_own_keys" {
  statement {
    actions = [
      "iam:GetAccountPasswordPolicy",
      "iam:ListUsers",
      "iam:GetAccountSummary"
    ]
    resources = ["*"]
  }
  statement {
    actions = [
      "iam:GetUser",
      "iam:ChangePassword"
    ]
    resources = [
      "arn:aws:iam::*:user/&{aws:username}"
    ]
  }
  statement {
    actions = [
      "iam:DeleteAccessKey",
      "iam:GetAccessKeyLastUsed",
      "iam:UpdateAccessKey",
      "iam:CreateAccessKey",
      "iam:ListAccessKeys"
    ]
    resources = [
      "arn:aws:iam::*:user/&{aws:username}"
    ]
  }
  statement {
    actions = [
      "iam:ListSSHPublicKeys",
      "iam:GetSSHPublicKey",
      "iam:UploadSSHPublicKey",
      "iam:DeleteSSHPublicKey",
      "iam:UpdateSSHPublicKey"
    ]
    resources = ["arn:aws:iam::*:user/&{aws:username}"]
  }
}

resource "aws_iam_policy" "terraform_operator" {
  name   = "terraform-operator"
  policy = data.aws_iam_policy_document.terraform_operator.json
}

resource "aws_iam_policy" "manage_own_keys" {
  name   = "manage-own-keys"
  policy = data.aws_iam_policy_document.manage_own_keys.json
}

resource "aws_iam_group_policy_attachment" "alumnos_change_password" {
  group      = data.aws_iam_group.alumnos_group.group_name
  policy_arn = data.aws_iam_policy.change_password.arn
}

resource "aws_iam_group_policy_attachment" "alumnos_terraform" {
  group      = data.aws_iam_group.alumnos_group.group_name
  policy_arn = aws_iam_policy.terraform_operator.arn
}

resource "aws_iam_group_policy_attachment" "alumnos_manage_own_keys" {
  group      = data.aws_iam_group.alumnos_group.group_name
  policy_arn = aws_iam_policy.manage_own_keys.arn
}

resource "aws_iam_group_policy_attachment" "alumnos_ec2" {
  group      = data.aws_iam_group.alumnos_group.group_name
  policy_arn = data.aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_group_policy_attachment" "alumnos_ssm" {
  group      = data.aws_iam_group.alumnos_group.group_name
  policy_arn = data.aws_iam_policy.ssm_full_access.arn
}

resource "aws_iam_group_policy_attachment" "alumnos_ec2_instance_connect" {
  group      = data.aws_iam_group.alumnos_group.group_name
  policy_arn = data.aws_iam_policy.ec2_instance_connect.arn
}
