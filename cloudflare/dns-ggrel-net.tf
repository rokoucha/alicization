resource "cloudflare_dns_record" "ggrel_net_caa_issue" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "ggrel.net"
  type    = "CAA"
  ttl     = 1
  data = {
    flags = "0"
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_dns_record" "ggrel_net_caa_issuewild" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "ggrel.net"
  type    = "CAA"
  ttl     = 1
  data = {
    flags = "0"
    tag   = "issuewild"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_dns_record" "ggrel_net_cname_materia_cluster" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "materia-cluster.ggrel.net"
  type    = "CNAME"
  content = "lithium.dns.ggrel.net"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "ggrel_net_cname_materia" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "materia.ggrel.net"
  type    = "CNAME"
  content = "lithium.dns.ggrel.net"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "ggrel_net_cname_dkim" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "sig1._domainkey.ggrel.net"
  type    = "CNAME"
  content = "sig1.dkim.ggrel.net.at.icloudmailadmin.com"
  proxied = false
  ttl     = 3600
}

resource "cloudflare_dns_record" "ggrel_net_mx_primary" {
  zone_id  = local.zone_id["ggrel.net"]
  name     = "ggrel.net"
  type     = "MX"
  content  = "mx01.mail.icloud.com"
  priority = 10
  ttl      = 3600
}

resource "cloudflare_dns_record" "ggrel_net_mx_secondary" {
  zone_id  = local.zone_id["ggrel.net"]
  name     = "ggrel.net"
  type     = "MX"
  content  = "mx02.mail.icloud.com"
  priority = 10
  ttl      = 3600
}

resource "cloudflare_dns_record" "ggrel_net_txt_dmarc" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "_dmarc.ggrel.net"
  type    = "TXT"
  content = "v=DMARC1; p=quarantine; adkim=s"
  ttl     = 1
}

resource "cloudflare_dns_record" "ggrel_net_txt_apple_domain" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "ggrel.net"
  type    = "TXT"
  content = "apple-domain=3J9bInEzoF3qYmdl"
  ttl     = 3600
}

resource "cloudflare_dns_record" "ggrel_net_txt_spf" {
  zone_id = local.zone_id["ggrel.net"]
  name    = "ggrel.net"
  type    = "TXT"
  content = "v=spf1 include:icloud.com ~all"
  ttl     = 3600
}
