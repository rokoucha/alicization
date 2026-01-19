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
resource "cloudflare_record" "zones_ggrelnet_dns-cname-auth_7AD06318" {
  content = "materia.ggrel.net"
  name    = "auth"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-dtv_9B130C4C" {
  content = "materia.ggrel.net"
  name    = "dtv"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-ggrelnet_CF7C4D90" {
  content = "materia.ggrel.net"
  name    = "ggrel.net"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-macdn_E083E72F" {
  content = "public.r2.dev"
  name    = "ma.cdn"
  proxied = true
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-materia_289AD27E" {
  content = "lithium.dns.ggrel.net"
  name    = "materia"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-argocdmateria_19ED91E1" {
  content = "materia.ggrel.net"
  name    = "argocd.materia"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-hubblemateria_91826267" {
  content = "materia.ggrel.net"
  name    = "hubble.materia"
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
resource "cloudflare_record" "zones_ggrelnet_dns-cname-miniflux_C4FF10DA" {
  content = "materia.ggrel.net"
  name    = "miniflux"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_ggrelnet_zone_C68FFF1A.id
}
resource "cloudflare_record" "zones_ggrelnet_dns-cname-monitor_2D4F0486" {
  content = "materia.ggrel.net"
  name    = "monitor"
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
resource "cloudflare_record" "zones_ggrelnet_dns-cname-ts_10DC04DD" {
  content = "materia.ggrel.net"
  name    = "ts"
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
