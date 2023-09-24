import { Record } from '@cdktf/provider-cloudflare/lib/record/index.js'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'

export type RokouchaNetConfig = Readonly<{
  accountId: string
}>

export class RokouchaNet extends Construct {
  constructor(scope: Construct, id: string, config: RokouchaNetConfig) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: 'rokoucha.net',
    })

    new Record(this, 'dns-cname-blog', {
      name: 'blog',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-dk1._domainkey', {
      name: 'dk1._domainkey',
      proxied: false,
      type: 'CNAME',
      value: 'dk1._domainkey.anonaddy.me',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-dk2._domainkey', {
      name: 'dk2._domainkey',
      proxied: false,
      type: 'CNAME',
      value: 'dk2._domainkey.anonaddy.me',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-dot', {
      name: 'dot',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ma', {
      name: 'ma',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-pl', {
      name: 'pl',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-rokoucha.net', {
      name: 'rokoucha.net',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-20-rokoucha.net', {
      name: 'rokoucha.net',
      priority: 20,
      type: 'MX',
      value: 'mail2.anonaddy.me',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-10-rokoucha.net', {
      name: 'rokoucha.net',
      priority: 10,
      type: 'MX',
      value: 'mail.anonaddy.me',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-_dmarc', {
      name: '_dmarc',
      type: 'TXT',
      value: 'v=DMARC1; p=quarantine; adkim=s',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-keybase-1-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      value:
        'keybase-site-verification=Z2ir0Ch9z6sEXbYWuEdbBQ5quHNhx2pHGWcKtikUsSg',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-pnut-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      value: 'pnut_verification=rokoucha https',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-google-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      value:
        'google-site-verification=6Y9afyLcYvlZn8ZL792aeXy9FbRNK-P6ilJoLuiiZkg',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-spf-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      value: 'v=spf1 include:spf.anonaddy.me -all',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-aa-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      value: 'aa-verify=9eea9fe3ebc99e620864cabfd9e411873255ce1d',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-keybase-2-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      value:
        'keybase-site-verification=9_ss9mTHEErcN4--pZs4MXHDa5FzNvwtx_SEv5jhOmc',
      zoneId: zone.id,
    })
  }
}
