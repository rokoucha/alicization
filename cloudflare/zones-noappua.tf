resource "cloudflare_zone" "zones_noappua_zone_62EBFFE8" {
  account_id = cloudflare_account.account.id
  zone       = "noa.pp.ua"
}
removed {
  from = cloudflare_record.zones_noappua_dns-cname-noappua_845D89DF

  lifecycle {
    destroy = false
  }
}
removed {
  from = cloudflare_record.zones_noappua_dns-cname-himesakanoappua_B9414D1C

  lifecycle {
    destroy = false
  }
}
