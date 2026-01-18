terraform {
  required_providers {
    cloudflare = {
      version = "5.15.0"
      source  = "cloudflare/cloudflare"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    organization = "rokoucha"
    workspaces {
      name = "cloudflare"
    }
  }

}

provider "cloudflare" {
}
resource "cloudflare_account" "account" {
  name = "rokoucha"
}

variable "pages_auth-js-cloudflare-pages-functions_AUTH_GITHUB_ID_66A2BFFB" {
  description = "authjs-cloudflare-pages-functions AUTH_GITHUB_ID"
  type        = string
}

variable "pages_auth-js-cloudflare-pages-functions_AUTH_GITHUB_SECRET_C4ED44EC" {
  description = "authjs-cloudflare-pages-functions AUTH_GITHUB_SECRET"
  type        = string
  sensitive   = true
}

variable "pages_auth-js-cloudflare-pages-functions_AUTH_SECRET_616905F8" {
  description = "authjs-cloudflare-pages-functions AUTH_SECRET"
  type        = string
  sensitive   = true
}
resource "cloudflare_pages_project" "pages_auth-js-cloudflare-pages-functions_authjs-cloudflare-pages-functions_359294B8" {
  account_id        = cloudflare_account.account.id
  name              = "authjs-cloudflare-pages-functions"
  production_branch = "main"
  build_config {
    build_caching   = true
    build_command   = "pnpm run build"
    destination_dir = "./public"
  }
  deployment_configs {
    production {
      compatibility_date = "2023-12-03"
      compatibility_flags = [

      ]
      environment_variables = {
        AUTH_GITHUB_ID = "${var.pages_auth-js-cloudflare-pages-functions_AUTH_GITHUB_ID_66A2BFFB}"
        NODE_VERSION   = "20"
      }
      fail_open = false
      secrets = {
        AUTH_GITHUB_SECRET = "${var.pages_auth-js-cloudflare-pages-functions_AUTH_GITHUB_SECRET_C4ED44EC}"
        AUTH_SECRET        = "${var.pages_auth-js-cloudflare-pages-functions_AUTH_SECRET_616905F8}"
      }
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "none"
      production_branch          = "main"
      repo_name                  = "authjs-cloudflare-pages-functions"
    }
  }
}

variable "pages_cloudflare-pages-function-next-js_AUTH_GITHUB_ID_1482998B" {
  description = "cloudflare-pages-function-next-js AUTH_GITHUB_ID"
  type        = string
}

variable "pages_cloudflare-pages-function-next-js_AUTH_GITHUB_SECRET_74848C5F" {
  description = "cloudflare-pages-function-next-js AUTH_GITHUB_SECRET"
  type        = string
  sensitive   = true
}

variable "pages_cloudflare-pages-function-next-js_AUTH_SECRET_20C3562D" {
  description = "cloudflare-pages-function-next-js AUTH_SECRET"
  type        = string
  sensitive   = true
}
resource "cloudflare_pages_project" "pages_cloudflare-pages-function-next-js_96D3039F" {
  account_id        = cloudflare_account.account.id
  name              = "cloudflare-pages-function-next-js"
  production_branch = "master"
  build_config {
    build_command   = "pnpm run build:next"
    destination_dir = ".vercel/output/static"
  }
  deployment_configs {
    production {
      compatibility_date = "2023-07-22"
      compatibility_flags = [
        "nodejs_compat"
      ]
      environment_variables = {
        AUTH_GITHUB_ID  = "${var.pages_cloudflare-pages-function-next-js_AUTH_GITHUB_ID_1482998B}"
        AUTH_TRUST_HOST = "cloudflare-pages-function-next-js.pages.dev"
        NODE_VERSION    = "20"
      }
      fail_open = true
      secrets = {
        AUTH_GITHUB_SECRET = "${var.pages_cloudflare-pages-function-next-js_AUTH_GITHUB_SECRET_74848C5F}"
        AUTH_SECRET        = "${var.pages_cloudflare-pages-function-next-js_AUTH_SECRET_20C3562D}"
      }
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "none"
      production_branch          = "master"
      repo_name                  = "cloudflare-pages-function-next-js"
    }
  }
}
resource "cloudflare_pages_project" "pages_cwskk_E3C50676" {
  account_id        = cloudflare_account.account.id
  name              = "cwskk"
  production_branch = "master"
  build_config {
    build_caching   = true
    build_command   = "pnpm run build:preview"
    destination_dir = "dist/preview"
  }
  deployment_configs {
    production {
      environment_variables = {
        NODE_VERSION = "22"
      }
      fail_open   = true
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "all"
      production_branch          = "master"
      repo_name                  = "cwskk"
    }
  }
}
resource "cloudflare_pages_project" "pages_gjx_DF6C2770" {
  account_id        = cloudflare_account.account.id
  name              = "gjx"
  production_branch = "master"
  build_config {
    build_command   = "pnpm run build"
    destination_dir = "build"
  }
  deployment_configs {
    production {
      fail_open   = true
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "none"
      production_branch          = "master"
      repo_name                  = "gjx"
    }
  }
}
resource "cloudflare_pages_project" "pages_petapeta_CB57F07D" {
  account_id        = cloudflare_account.account.id
  name              = "petapeta"
  production_branch = "master"
  build_config {
    build_command   = "yarn run build"
    destination_dir = "dist"
  }
  deployment_configs {
    production {
      environment_variables = {
        NODE_VERSION = "20"
      }
      fail_open   = true
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "all"
      production_branch          = "master"
      repo_name                  = "petapeta"
    }
  }
}

variable "pages_scienest_AUTH_GITHUB_ID_14B14276" {
  description = "Scienest AUTH_GITHUB_ID"
  type        = string
}

variable "pages_scienest_AUTH_GITHUB_SECRET_D05B4844" {
  description = "Scienest AUTH_GITHUB_SECRET"
  type        = string
  sensitive   = true
}

variable "pages_scienest_AUTH_SECRET_5AB749E8" {
  description = "Scienest AUTH_SECRET"
  type        = string
  sensitive   = true
}
resource "cloudflare_pages_project" "pages_scienest_20D3D293" {
  account_id        = cloudflare_account.account.id
  name              = "scienest"
  production_branch = "master"
  build_config {
    build_caching   = true
    build_command   = "pnpm run build:next"
    destination_dir = ".vercel/output/static"
  }
  deployment_configs {
    production {
      compatibility_date = "2024-06-03"
      compatibility_flags = [
        "nodejs_compat"
      ]
      d1_databases = {
        DB = "6932807b-60cc-425a-b309-eebcea6f13c4"
      }
      environment_variables = {
        APP_ENV                = "production"
        AUTH_GITHUB_ID         = "${var.pages_scienest_AUTH_GITHUB_ID_14B14276}"
        AUTH_TRUST_HOST        = "rokoucha.net"
        BASE_URL               = "https://rokoucha.net"
        GITHUB_USER_ID         = "6058487"
        NODE_VERSION           = "20"
        SITE_DESCRIPTION       = "The world isn't my oyster."
        SITE_LANG              = "ja"
        SITE_NAME              = "Rokoucha"
        SITE_TWITTER_CARD_SITE = "@rokoucha"
      }
      fail_open = true
      secrets = {
        AUTH_GITHUB_SECRET = "${var.pages_scienest_AUTH_GITHUB_SECRET_D05B4844}"
        AUTH_SECRET        = "${var.pages_scienest_AUTH_SECRET_5AB749E8}"
      }
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "none"
      production_branch          = "master"
      repo_name                  = "scienest"
    }
  }
}
resource "cloudflare_pages_project" "pages_super-seisan_FC830EEF" {
  account_id        = cloudflare_account.account.id
  name              = "super-seisan"
  production_branch = "main"
  build_config {
    build_command   = "pnpm run build"
    destination_dir = "dist"
    root_dir        = "./legacy"
  }
  deployment_configs {
    production {
      compatibility_date = "2025-11-17"
      environment_variables = {

      }
      fail_open   = true
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner               = "rokoucha"
      pr_comments_enabled = true
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "all"
      production_branch          = "main"
      repo_name                  = "super-seisan"
    }
  }
}

variable "pages_tweet2scrapbox_TWITTER_BEARER_TOKEN_2DED0709" {
  description = "tweet2scrapbox TWITTER_BEARER_TOKEN"
  type        = string
}
resource "cloudflare_pages_project" "pages_tweet2scrapbox_6AE43398" {
  account_id        = cloudflare_account.account.id
  name              = "tweet2scrapbox"
  production_branch = "master"
  build_config {
    build_command   = "pnpm run build"
    destination_dir = "public"
  }
  deployment_configs {
    production {
      compatibility_date = "2023-04-20"
      environment_variables = {
        NODE_VERSION = "20"
      }
      fail_open = true
      secrets = {
        TWITTER_BEARER_TOKEN = "${var.pages_tweet2scrapbox_TWITTER_BEARER_TOKEN_2DED0709}"
      }
      usage_model = "standard"
    }
  }
  source {
    type = "github"
    config {
      owner = "rokoucha"
      preview_branch_includes = [
        "*"
      ]
      preview_deployment_setting = "all"
      production_branch          = "master"
      repo_name                  = "tweet2scrapbox"
    }
  }
}
resource "cloudflare_r2_bucket" "r2_mastodon_8484DC88" {
  account_id = cloudflare_account.account.id
  name       = "mastodon"
}
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
resource "cloudflare_zone" "zones_rokouchanet_zone_DF751E70" {
  account_id = cloudflare_account.account.id
  zone       = "rokoucha.net"
}
resource "cloudflare_record" "zones_rokouchanet_dns-cname-dot_7B57CE89" {
  content = "materia.ggrel.net"
  name    = "dot"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-cname-ma_7A73B89C" {
  content = "materia.ggrel.net"
  name    = "ma"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
}
resource "cloudflare_record" "zones_rokouchanet_dns-cname-pl_1C94C1AF" {
  content = "materia.ggrel.net"
  name    = "pl"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_rokouchanet_zone_DF751E70.id
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
resource "cloudflare_zone" "zones_sayn-wittgenstein_zone_DB53E6D0" {
  account_id = cloudflare_account.account.id
  zone       = "sayn-wittgenste.in"
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-cname-heinrikeprinzessinzusayn-wittgenstein_6A2E59EA" {
  content = "sayn-wittgenste.in"
  name    = "heinrike.prinzessin.zu"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
}
resource "cloudflare_record" "zones_sayn-wittgenstein_dns-cname-sayn-wittgenstein_2ECDC464" {
  content = "materia.ggrel.net"
  name    = "sayn-wittgenste.in"
  proxied = false
  type    = "CNAME"
  zone_id = cloudflare_zone.zones_sayn-wittgenstein_zone_DB53E6D0.id
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
