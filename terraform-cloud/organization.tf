resource "tfe_organization" "organization" {
  email                               = var.TFC_ORGANIZATION_EMAIL
  name                                = "rokoucha"
  speculative_plan_management_enabled = false
}
resource "tfe_project" "alicization" {
  name         = "alicization"
  organization = tfe_organization.organization.name
}
