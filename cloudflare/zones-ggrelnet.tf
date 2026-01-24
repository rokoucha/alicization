resource "cloudflare_zone" "zones_ggrelnet_zone_C68FFF1A" {
  account_id = cloudflare_account.account.id
  zone       = "ggrel.net"
}
resource "cloudflare_record" "zones_ggrelnet_dns-caa-issuewild-le-ggrelnet_D1CA5C70" {
  name    = "ggrel.net"
  type    = "CAA"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
  data {
    flags = "0"
    tag   = "issuewild"
    value = "letsencrypt.org"
  }
}
resource "cloudflare_record" "zones_ggrelnet_dns-caa-issue-le-ggrelnet_EBAC447C" {
  name    = "ggrel.net"
  type    = "CAA"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
  data {
    flags = "0"
    tag   = "issue"
    value = "letsencrypt.org"
  }
}
removed {
  from = cloudflare_record.zones_ggrelnet_dns-cname-macdn_E083E72F
  lifecycle {
    destroy = false
  }
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-materia_289AD27E" {
  content = "lithium.dns.ggrel.net"
  name    = "materia"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-materia-cluster_7DFFF2B7" {
  content = "lithium.dns.ggrel.net"
  name    = "materia-cluster"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-sig1_domainkey_E80C5207" {
  content = "sig1.dkim.ggrel.net.at.icloudmailadmin.com"
  name    = "sig1._domainkey"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-mx-10-icloud-1_2A0A19DE" {
  content  = "mx01.mail.icloud.com"
  name     = "ggrel.net"
  priority = 10
  type     = "MX"
  zone_id  = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-mx-10-icloud-2_F421A992" {
  content  = "mx02.mail.icloud.com"
  name     = "ggrel.net"
  priority = 10
  type     = "MX"
  zone_id  = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-txt-spf_213B88C5" {
  content = "v=spf1 include:icloud.com ~all"
  name    = "ggrel.net"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-txt-icloud_48E249B9" {
  content = "apple-domain=3J9bInEzoF3qYmdl"
  name    = "ggrel.net"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-txt-_dmarc_7C7E9725" {
  content = "v=DMARC1; p=quarantine; adkim=s"
  name    = "_dmarc"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
