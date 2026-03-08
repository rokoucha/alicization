data "aws_ssoadmin_instances" "this" {}

locals {
  sso_instance_arn      = one(data.aws_ssoadmin_instances.this.arns)
  sso_identity_store_id = one(data.aws_ssoadmin_instances.this.identity_store_ids)

  permission_sets = {
    AdministratorAccess = { managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" }
    PowerUserAccess     = { managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess" }
    ViewOnlyAccess      = { managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess" }
  }
}

resource "aws_ssoadmin_permission_set" "this" {
  for_each = local.permission_sets

  instance_arn     = local.sso_instance_arn
  name             = each.key
  session_duration = "PT8H"
}

resource "aws_ssoadmin_managed_policy_attachment" "this" {
  for_each = local.permission_sets

  instance_arn       = local.sso_instance_arn
  managed_policy_arn = each.value.managed_policy_arn
  permission_set_arn = aws_ssoadmin_permission_set.this[each.key].arn
}

resource "aws_identitystore_group" "admin" {
  display_name      = "admin"
  identity_store_id = local.sso_identity_store_id
}

resource "aws_ssoadmin_account_assignment" "admin" {
  for_each = local.permission_sets

  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this[each.key].arn
  principal_id       = aws_identitystore_group.admin.group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.rokoucha.id
  target_type        = "AWS_ACCOUNT"
}

moved {
  from = data.aws_ssoadmin_instances.iam-identity-center_sso-instance_D5464687
  to   = data.aws_ssoadmin_instances.this
}

moved {
  from = aws_ssoadmin_permission_set.iam-identity-center_administrator-access_727B94DD
  to   = aws_ssoadmin_permission_set.this["AdministratorAccess"]
}

moved {
  from = aws_ssoadmin_permission_set.iam-identity-center_power-user-access_3631F70F
  to   = aws_ssoadmin_permission_set.this["PowerUserAccess"]
}

moved {
  from = aws_ssoadmin_permission_set.iam-identity-center_view-only-access_E657B48F
  to   = aws_ssoadmin_permission_set.this["ViewOnlyAccess"]
}

moved {
  from = aws_ssoadmin_managed_policy_attachment.iam-identity-center_permission-set_administrator-access-attachment_902BB47A
  to   = aws_ssoadmin_managed_policy_attachment.this["AdministratorAccess"]
}

moved {
  from = aws_ssoadmin_managed_policy_attachment.iam-identity-center_permission-set_power-user-access-attachment_CE73E163
  to   = aws_ssoadmin_managed_policy_attachment.this["PowerUserAccess"]
}

moved {
  from = aws_ssoadmin_managed_policy_attachment.iam-identity-center_permission-set_view-only-access-attachment_DEE33DB3
  to   = aws_ssoadmin_managed_policy_attachment.this["ViewOnlyAccess"]
}

moved {
  from = aws_identitystore_group.iam-identity-center_identity-store_admin_2C0095E4
  to   = aws_identitystore_group.admin
}

moved {
  from = aws_ssoadmin_account_assignment.iam-identity-center_aws--organizations--rokoucha-aws--iam-identity-center--identity-store--admin-aws--iam-identity-center--administrator-access_BD64B917
  to   = aws_ssoadmin_account_assignment.admin["AdministratorAccess"]
}

moved {
  from = aws_ssoadmin_account_assignment.iam-identity-center_aws--organizations--rokoucha-aws--iam-identity-center--identity-store--admin-aws--iam-identity-center--power-user-access_CA976059
  to   = aws_ssoadmin_account_assignment.admin["PowerUserAccess"]
}

moved {
  from = aws_ssoadmin_account_assignment.iam-identity-center_aws--organizations--rokoucha-aws--iam-identity-center--identity-store--admin-aws--iam-identity-center--view-only-access_B935449A
  to   = aws_ssoadmin_account_assignment.admin["ViewOnlyAccess"]
}
