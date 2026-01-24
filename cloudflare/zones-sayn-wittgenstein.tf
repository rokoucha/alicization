resource "cloudflare_zone" "zones_sayn-wittgenstein_zone_DB53E6D0" {
  account_id = cloudflare_account.account.id
  zone       = "sayn-wittgenste.in"
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-mx-verification-sayn-wittgenstein_EFC05122" {
  content  = "qopfxxhethpfg6oj5ubrjxup5aayjzhcjd2tu2ejl4myv2xfsl7q.mx-verification.google.com"
  name     = "sayn-wittgenste.in"
  priority = 10
  type     = "MX"
  zone_id  = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-mx-alt4-sayn-wittgenstein_000B78EC" {
  content  = "alt4.aspmx.l.google.com"
  name     = "sayn-wittgenste.in"
  priority = 10
  type     = "MX"
  zone_id  = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-mx-alt3-sayn-wittgenstein_6BB0233E" {
  content  = "alt3.aspmx.l.google.com"
  name     = "sayn-wittgenste.in"
  priority = 10
  type     = "MX"
  zone_id  = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-mx-alt2-sayn-wittgenstein_EABF5793" {
  content  = "alt2.aspmx.l.google.com"
  name     = "sayn-wittgenste.in"
  priority = 5
  type     = "MX"
  zone_id  = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-mx-alt1-sayn-wittgenstein_842F9F49" {
  content  = "alt1.aspmx.l.google.com"
  name     = "sayn-wittgenste.in"
  priority = 5
  type     = "MX"
  zone_id  = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-mx-1-sayn-wittgenstein_71580CEF" {
  content  = "aspmx.l.google.com"
  name     = "sayn-wittgenste.in"
  priority = 1
  type     = "MX"
  zone_id  = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-txt-_dmarc_B16FED46" {
  content = "v=DMARC1; p=none; rua=mailto:heinrike.prinzessin.zu.sayn-wittgenste.in"
  name    = "_dmarc"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-txt-google_domainkey_DD2394A1" {
  content = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArVbmlsyvPbqNdN9FMO+7h0vR0cmY8xXZS6kOV2+FIggaQ5jcR8KNnLvmjS5BS0JUv+l+yFjNlPuS0S6uKzYXplvDhNcp/WbbETcMv2jkIBVRWGa6ExZQBmF2iZEql5IiDfSlvQOfgrEsEJjqy5qYtHM6pmamNzoqBERN+xLldTr/NEaUr1AexzxJ5/15bY89isOLUj92RXdR5j8lpHUzx1WbVDhIUUF4ZftzRVfvrG+TMsYj2W3WaaiN230wd6KB6duBEBqTY5fCBYQmI5WjgT53QG8UEhi1ANEWmzrL9qyAiSDFjNkBIgFGrf1e0hDiM3TBWQVynys4cx5XznUAQQIDAQAB"
  name    = "google._domainkey"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-txt-spf-sayn-wittgenstein_CCF26085" {
  content = "v=spf1 include:_spf.google.com ~all"
  name    = "sayn-wittgenste.in"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
