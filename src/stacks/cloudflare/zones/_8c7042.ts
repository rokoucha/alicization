import { Record } from '@cdktf/provider-cloudflare/lib/record/index.js'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'

export type _8c7042Config = Readonly<{
  accountId: string
}>

export class _8c7042 extends Construct {
  constructor(scope: Construct, id: string, config: _8c7042Config) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: '8c7042.org',
    })

    new Record(this, 'dns-cname-8c7042.org', {
      name: '8c7042.org',
      proxied: true,
      type: 'CNAME',
      value: '8c7042-org.pages.dev',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-sig1._domainkey', {
      name: 'sig1._domainkey',
      proxied: false,
      type: 'CNAME',
      value: 'sig1.dkim.8c7042.org.at.icloudmailadmin.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-10-icloud-1-8c7042.org', {
      name: '8c7042.org',
      priority: 10,
      type: 'MX',
      value: 'mx01.mail.icloud.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-10-icloud-2-8c7042.org', {
      name: '8c7042.org',
      priority: 10,
      type: 'MX',
      value: 'mx02.mail.icloud.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-icloud-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      value: 'apple-domain=RXW85mjzVL0dxHaU',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-spf-8c7042.org', {
      name: '8c7042.org',
      type: 'TXT',
      value: 'v=spf1 include:icloud.com ~all',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-_dmarc', {
      name: '_dmarc',
      type: 'TXT',
      value: 'v=DMARC1; p=quarantine; adkim=s',
      zoneId: zone.id,
    })
  }
}
