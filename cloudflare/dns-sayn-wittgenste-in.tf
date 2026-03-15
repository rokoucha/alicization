resource "cloudflare_dns_record" "sayn_wittgenste_in_mx_aspmx" {
  zone_id  = local.zone_id["sayn-wittgenste.in"]
  name     = "sayn-wittgenste.in"
  type     = "MX"
  content  = "aspmx.l.google.com"
  priority = 1
  ttl      = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_mx_alt1" {
  zone_id  = local.zone_id["sayn-wittgenste.in"]
  name     = "sayn-wittgenste.in"
  type     = "MX"
  content  = "alt1.aspmx.l.google.com"
  priority = 5
  ttl      = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_mx_alt2" {
  zone_id  = local.zone_id["sayn-wittgenste.in"]
  name     = "sayn-wittgenste.in"
  type     = "MX"
  content  = "alt2.aspmx.l.google.com"
  priority = 5
  ttl      = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_mx_alt3" {
  zone_id  = local.zone_id["sayn-wittgenste.in"]
  name     = "sayn-wittgenste.in"
  type     = "MX"
  content  = "alt3.aspmx.l.google.com"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_mx_alt4" {
  zone_id  = local.zone_id["sayn-wittgenste.in"]
  name     = "sayn-wittgenste.in"
  type     = "MX"
  content  = "alt4.aspmx.l.google.com"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_mx_verification" {
  zone_id  = local.zone_id["sayn-wittgenste.in"]
  name     = "sayn-wittgenste.in"
  type     = "MX"
  content  = "qopfxxhethpfg6oj5ubrjxup5aayjzhcjd2tu2ejl4myv2xfsl7q.mx-verification.google.com"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_txt_dmarc" {
  zone_id = local.zone_id["sayn-wittgenste.in"]
  name    = "_dmarc.sayn-wittgenste.in"
  type    = "TXT"
  content = "v=DMARC1; p=none; rua=mailto:heinrike.prinzessin.zu.sayn-wittgenste.in"
  ttl     = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_txt_dkim_google" {
  zone_id = local.zone_id["sayn-wittgenste.in"]
  name    = "google._domainkey.sayn-wittgenste.in"
  type    = "TXT"
  content = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArVbmlsyvPbqNdN9FMO+7h0vR0cmY8xXZS6kOV2+FIggaQ5jcR8KNnLvmjS5BS0JUv+l+yFjNlPuS0S6uKzYXplvDhNcp/WbbETcMv2jkIBVRWGa6ExZQBmF2iZEql5IiDfSlvQOfgrEsEJjqy5qYtHM6pmamNzoqBERN+xLldTr/NEaUr1AexzxJ5/15bY89isOLUj92RXdR5j8lpHUzx1WbVDhIUUF4ZftzRVfvrG+TMsYj2W3WaaiN230wd6KB6duBEBqTY5fCBYQmI5WjgT53QG8UEhi1ANEWmzrL9qyAiSDFjNkBIgFGrf1e0hDiM3TBWQVynys4cx5XznUAQQIDAQAB"
  ttl     = 1
}

resource "cloudflare_dns_record" "sayn_wittgenste_in_txt_spf" {
  zone_id = local.zone_id["sayn-wittgenste.in"]
  name    = "sayn-wittgenste.in"
  type    = "TXT"
  content = "v=spf1 include:_spf.google.com ~all"
  ttl     = 1
}
