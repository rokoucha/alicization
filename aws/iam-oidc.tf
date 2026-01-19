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
