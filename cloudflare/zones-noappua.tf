resource "cloudflare_zone" "zones_noappua_zone_62EBFFE8" {
  account_id = cloudflare_account.account.id
  zone       = "noa.pp.ua"
}
