resource "cloudflare_worker_script" "workers_ikapri_F0DA4402" {
  account_id = cloudflare_account.account.id
  content    = ""
  name       = "ikapri"
  lifecycle {
    ignore_changes = [
      "content",
    ]
  }
}
resource "cloudflare_worker_script" "workers_kuroneko-tracker-feed_CE5B6933" {
  account_id = cloudflare_account.account.id
  content    = ""
  module     = true
  name       = "kuroneko-tracker-feed"
  plain_text_binding {
    name = "BASE_URL"
    text = "https://kuroneko-tracker-feed.rokoucha.workers.dev"
  }
  plain_text_binding {
    name = "KURONEKO_URL"
    text = "https://toi.kuronekoyamato.co.jp/cgi-bin/tneko"
  }
  plain_text_binding {
    name = "VERSION"
    text = "2.0.0"
  }
  lifecycle {
    ignore_changes = [
      "content",
    ]
  }
}
resource "cloudflare_worker_script" "workers_oh-big-7_59A8CDCB" {
  account_id = cloudflare_account.account.id
  content    = ""
  module     = true
  name       = "oh-big-7"
  lifecycle {
    ignore_changes = [
      "content",
    ]
  }
}
