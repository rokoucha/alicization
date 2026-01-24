resource "cloudflare_zone" "zones_rokouchanet_zone_DF751E70" {
  account_id = cloudflare_account.account.id
  zone       = "rokoucha.net"
}
resource "cloudflare_record" "zones_rokouchanet_dns-cname-rokouchanet_DF41DF62" {
  content = "maillard.pages.dev"
  name    = "rokoucha.net"
  proxied = true
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-cname-sig1_domainkey_6AD7F9A5" {
  content = "sig1.dkim.rokoucha.net.at.icloudmailadmin.com"
  name    = "sig1._domainkey"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-mx-10-icloud-1-rokouchanet_3444E10F" {
  content  = "mx01.mail.icloud.com"
  name     = "rokoucha.net"
  priority = 10
  type     = "MX"
  zone_id  = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-mx-10-icloud-2-rokouchanet_CABB2954" {
  content  = "mx02.mail.icloud.com"
  name     = "rokoucha.net"
  priority = 10
  type     = "MX"
  zone_id  = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-txt-_dmarc_C6963C2E" {
  content = "v=DMARC1; p=quarantine; adkim=s"
  name    = "_dmarc"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-txt-icloud-rokouchanet_83137920" {
  content = "apple-domain=Pabb9Q5wD0ltdWbS"
  name    = "rokoucha.net"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-txt-keybase-rokouchanet_DB54ACB9" {
  content = "keybase-site-verification=Z2ir0Ch9z6sEXbYWuEdbBQ5quHNhx2pHGWcKtikUsSg"
  name    = "rokoucha.net"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-txt-pnut-rokouchanet_D8D1ED9E" {
  content = "pnut_verification=rokoucha https"
  name    = "rokoucha.net"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-txt-google-rokouchanet_D2AE7C43" {
  content = "google-site-verification=6Y9afyLcYvlZn8ZL792aeXy9FbRNK-P6ilJoLuiiZkg"
  name    = "rokoucha.net"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-txt-spf-rokouchanet_6615D7A5" {
  content = "v=spf1 include:icloud.com ~all"
  name    = "rokoucha.net"
  type    = "TXT"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
