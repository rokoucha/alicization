terraform {
  required_providers {
    aws = {
      version = "6.25.0"
      source  = "aws"
    }
    tls = {
      version = "4.1.0"
      source  = "hashicorp/tls"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "aws"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

provider "tls" {
}
data "tls_certificate" "iam-oidc-provider_tfc-certificate_2F8403F3" {
  url = "https://app.terraform.io"
}
resource "aws_iam_openid_connect_provider" "iam-oidc-provider_tfc-oidc-provider_F99D1059" {
  client_id_list = [
    "aws.workload.identity"
  ]
  thumbprint_list = [
    "${data.tls_certificate.iam-oidc-provider_tfc-certificate_2F8403F3.certificates[0].sha1_fingerprint}"
  ]
  url = data.tls_certificate.iam-oidc-provider_tfc-certificate_2F8403F3.url
}
data "aws_iam_policy_document" "iam-oidc-provider_tfc-iam-oidc-provider-role-policy-document_B57D60C0" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]
    effect = "Allow"
    condition {
      test     = "StringEquals"
      values   = tolist(aws_iam_openid_connect_provider.iam-oidc-provider_tfc-oidc-provider_F99D1059.client_id_list)
      variable = "app.terraform.io:aud"
    }
    condition {
      test = "StringLike"
      values = [
        "organization:rokoucha:project:alicization:workspace:aws:run_phase:*"
      ]
      variable = "app.terraform.io:sub"
    }
    principals {
      identifiers = [
        "${aws_iam_openid_connect_provider.iam-oidc-provider_tfc-oidc-provider_F99D1059.arn}"
      ]
      type = "Federated"
    }
  }
}
resource "aws_iam_role" "iam-oidc-provider_tfc-iam-oidc-provider-role_BA45F5FC" {
  assume_role_policy = data.aws_iam_policy_document.iam-oidc-provider_tfc-iam-oidc-provider-role-policy-document_B57D60C0.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
  name = "alicization-tfc-iam-oidc-provider-role"
}
resource "aws_organizations_account" "organizations_rokoucha_EBC3DE83" {
  email = "esazeumo@8c7042.org"
  name  = "rokoucha"
}
data "aws_ssoadmin_instances" "iam-identity-center_sso-instance_D5464687" {
}
resource "aws_ssoadmin_managed_policy_attachment" "iam-identity-center_permission-set_administrator-access-attachment_902BB47A" {
  instance_arn       = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.iam-identity-center_administrator-access_727B94DD.arn
}
resource "aws_ssoadmin_managed_policy_attachment" "iam-identity-center_permission-set_power-user-access-attachment_CE73E163" {
  instance_arn       = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  permission_set_arn = aws_ssoadmin_permission_set.iam-identity-center_power-user-access_3631F70F.arn
}
resource "aws_ssoadmin_managed_policy_attachment" "iam-identity-center_permission-set_view-only-access-attachment_DEE33DB3" {
  instance_arn       = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.iam-identity-center_view-only-access_E657B48F.arn
}
resource "aws_ssoadmin_permission_set" "iam-identity-center_administrator-access_727B94DD" {
  instance_arn     = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  name             = "AdministratorAccess"
  session_duration = "PT8H"
}
resource "aws_ssoadmin_permission_set" "iam-identity-center_power-user-access_3631F70F" {
  instance_arn     = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  name             = "PowerUserAccess"
  session_duration = "PT8H"
}
resource "aws_ssoadmin_permission_set" "iam-identity-center_view-only-access_E657B48F" {
  instance_arn     = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  name             = "ViewOnlyAccess"
  session_duration = "PT8H"
}
resource "aws_identitystore_group" "iam-identity-center_identity-store_admin_2C0095E4" {
  display_name      = "admin"
  identity_store_id = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.identity_store_ids, 0)
}
resource "aws_ssoadmin_account_assignment" "iam-identity-center_aws--organizations--rokoucha-aws--iam-identity-center--identity-store--admin-aws--iam-identity-center--administrator-access_BD64B917" {
  instance_arn       = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  permission_set_arn = aws_ssoadmin_permission_set.iam-identity-center_administrator-access_727B94DD.arn
  principal_id       = aws_identitystore_group.iam-identity-center_identity-store_admin_2C0095E4.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.organizations_rokoucha_EBC3DE83.id
  target_type        = "AWS_ACCOUNT"
}
resource "aws_ssoadmin_account_assignment" "iam-identity-center_aws--organizations--rokoucha-aws--iam-identity-center--identity-store--admin-aws--iam-identity-center--power-user-access_CA976059" {
  instance_arn       = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  permission_set_arn = aws_ssoadmin_permission_set.iam-identity-center_power-user-access_3631F70F.arn
  principal_id       = aws_identitystore_group.iam-identity-center_identity-store_admin_2C0095E4.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.organizations_rokoucha_EBC3DE83.id
  target_type        = "AWS_ACCOUNT"
}
resource "aws_ssoadmin_account_assignment" "iam-identity-center_aws--organizations--rokoucha-aws--iam-identity-center--identity-store--admin-aws--iam-identity-center--view-only-access_B935449A" {
  instance_arn       = element(data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687.arns, 0)
  permission_set_arn = aws_ssoadmin_permission_set.iam-identity-center_view-only-access_E657B48F.arn
  principal_id       = aws_identitystore_group.iam-identity-center_identity-store_admin_2C0095E4.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.organizations_rokoucha_EBC3DE83.id
  target_type        = "AWS_ACCOUNT"
}
