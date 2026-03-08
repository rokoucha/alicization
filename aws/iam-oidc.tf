data "tls_certificate" "tfc" {
  url = "https://app.terraform.io"
}

resource "aws_iam_openid_connect_provider" "tfc" {
  client_id_list = [
    "aws.workload.identity"
  ]
  thumbprint_list = [
    data.tls_certificate.tfc.certificates[0].sha1_fingerprint
  ]
  url = data.tls_certificate.tfc.url
}

data "aws_iam_policy_document" "tfc_assume_role" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]
    effect = "Allow"
    condition {
      test     = "StringEquals"
      values   = tolist(aws_iam_openid_connect_provider.tfc.client_id_list)
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
        aws_iam_openid_connect_provider.tfc.arn
      ]
      type = "Federated"
    }
  }
}

resource "aws_iam_role" "tfc" {
  assume_role_policy = data.aws_iam_policy_document.tfc_assume_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
  name = "alicization-tfc-iam-oidc-provider-role"
}
