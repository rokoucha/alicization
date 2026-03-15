resource "cloudflare_dns_record" "rokoucha_net_cname_dkim" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "sig1._domainkey.rokoucha.net"
  type    = "CNAME"
  content = "sig1.dkim.rokoucha.net.at.icloudmailadmin.com"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "rokoucha_net_mx_primary" {
  zone_id  = local.zone_id["rokoucha.net"]
  name     = "rokoucha.net"
  type     = "MX"
  content  = "mx01.mail.icloud.com"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "rokoucha_net_mx_secondary" {
  zone_id  = local.zone_id["rokoucha.net"]
  name     = "rokoucha.net"
  type     = "MX"
  content  = "mx02.mail.icloud.com"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "rokoucha_net_txt_atproto" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "_atproto.rokoucha.net"
  type    = "TXT"
  content = "\"did=did:plc:eywgvnluntaovuiwznyqbcpk\""
  ttl     = 1
}

resource "cloudflare_dns_record" "rokoucha_net_txt_dmarc" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "_dmarc.rokoucha.net"
  type    = "TXT"
  content = "v=DMARC1; p=quarantine; adkim=s"
  ttl     = 1
}

resource "cloudflare_dns_record" "rokoucha_net_txt_spf" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "rokoucha.net"
  type    = "TXT"
  content = "v=spf1 include:icloud.com ~all"
  ttl     = 1
}

resource "cloudflare_dns_record" "rokoucha_net_txt_apple_domain" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "rokoucha.net"
  type    = "TXT"
  content = "apple-domain=Pabb9Q5wD0ltdWbS"
  ttl     = 1
}

resource "cloudflare_dns_record" "rokoucha_net_txt_keybase" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "rokoucha.net"
  type    = "TXT"
  content = "keybase-site-verification=Z2ir0Ch9z6sEXbYWuEdbBQ5quHNhx2pHGWcKtikUsSg"
  ttl     = 1
}

resource "cloudflare_dns_record" "rokoucha_net_txt_pnut" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "rokoucha.net"
  type    = "TXT"
  content = "pnut_verification=rokoucha https"
  ttl     = 1
}

resource "cloudflare_dns_record" "rokoucha_net_txt_google_verification" {
  zone_id = local.zone_id["rokoucha.net"]
  name    = "rokoucha.net"
  type    = "TXT"
  content = "google-site-verification=6Y9afyLcYvlZn8ZL792aeXy9FbRNK-P6ilJoLuiiZkg"
  ttl     = 1
}
