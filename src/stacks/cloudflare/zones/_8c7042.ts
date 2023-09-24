import { Record } from '@cdktf/provider-cloudflare/lib/record/index.js'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
import { Construct } from 'constructs'

export type _8c7042StackConfig = Readonly<{
  accountId: string
}>

export class _8c7042 extends Construct {
  constructor(scope: Construct, id: string, config: _8c7042StackConfig) {
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

    new Record(this, 'dns-mx-20-8c7042.org', {
      name: '8c7042.org',
      priority: 20,
      type: 'MX',
      value: 'mail2.anonaddy.me',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-10-8c7042.org', {
      name: '8c7042.org',
      priority: 10,
      type: 'MX',
      value: 'mail.anonaddy.me',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-spf-8c7042.org', {
      name: '8c7042.org',
      type: 'TXT',
      value: 'v=spf1 include:spf.anonaddy.me -all',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-aa-verify-8c7042.org', {
      name: '8c7042.org',
      type: 'TXT',
      value: 'aa-verify=4c6efab1c327f5d70453a0afcb2598107e4319ef',
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
