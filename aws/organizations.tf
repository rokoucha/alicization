resource "aws_organizations_account" "rokoucha" {
  email = "esazeumo@8c7042.org"
  name  = "rokoucha"
}

moved {
  from = aws_organizations_account.organizations_rokoucha_EBC3DE83
  to   = aws_organizations_account.rokoucha
}
