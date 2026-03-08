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
