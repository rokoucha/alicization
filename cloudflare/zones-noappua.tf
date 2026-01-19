resource "cloudflare_zone" "zones_noappua_zone_62EBFFE8" {
  account_id = cloudflare_account.account.id
  zone       = "noa.pp.ua"
}
resource "cloudflare_record" "zones_noappua_dns-cname-noappua_845D89DF" {
  content = "materia.ggrel.net"
  name    = "noa.pp.ua"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_noappua_zone_62EBFFE8.id
}
resource "cloudflare_record" "zones_noappua_dns-cname-himesakanoappua_B9414D1C" {
  content = "materia.ggrel.net"
  name    = "himesaka"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_noappua_zone_62EBFFE8.id
}
