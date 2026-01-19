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
