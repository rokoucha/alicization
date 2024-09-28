import { Record } from '@cdktf/provider-cloudflare/lib/record'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone'
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

    new Record(this, 'dns-cname-dot', {
      name: 'dot',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ma', {
      name: 'ma',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-pl', {
      name: 'pl',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-rokoucha.net', {
      name: 'rokoucha.net',
      proxied: false,
      type: 'CNAME',
      content: 'scienest.pages.dev',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-sig1._domainkey', {
      name: 'sig1._domainkey',
      proxied: false,
      type: 'CNAME',
      content: 'sig1.dkim.rokoucha.net.at.icloudmailadmin.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-10-icloud-1-rokoucha.net', {
      name: 'rokoucha.net',
      priority: 10,
      type: 'MX',
      content: 'mx01.mail.icloud.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-10-icloud-2-rokoucha.net', {
      name: 'rokoucha.net',
      priority: 10,
      type: 'MX',
      content: 'mx02.mail.icloud.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-_dmarc', {
      name: '_dmarc',
      type: 'TXT',
      content: 'v=DMARC1; p=quarantine; adkim=s',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-icloud-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      content: 'apple-domain=Pabb9Q5wD0ltdWbS',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-keybase-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      content:
        'keybase-site-verification=Z2ir0Ch9z6sEXbYWuEdbBQ5quHNhx2pHGWcKtikUsSg',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-pnut-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      content: 'pnut_verification=rokoucha https',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-google-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      content:
        'google-site-verification=6Y9afyLcYvlZn8ZL792aeXy9FbRNK-P6ilJoLuiiZkg',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-spf-rokoucha.net', {
      name: 'rokoucha.net',
      type: 'TXT',
      content: 'v=spf1 include:icloud.com ~all',
      zoneId: zone.id,
    })
  }
}
