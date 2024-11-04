import { Record } from '@cdktf/provider-cloudflare/lib/record'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone'
import { Construct } from 'constructs'

export type GgrelNetConfig = Readonly<{
  accountId: string
}>

export class GgrelNet extends Construct {
  constructor(scope: Construct, id: string, config: GgrelNetConfig) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: 'ggrel.net',
    })

    new Record(this, 'dns-a-haruka.dns', {
      name: 'haruka.dns',
      type: 'A',
      content: '172.16.2.21',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-a-carbon.dns', {
      name: 'carbon.dns',
      type: 'A',
      content: '0.0.0.0',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-a-nitrogen.dns', {
      name: 'nitrogen.dns',
      type: 'A',
      content: '172.16.2.14',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-beryllium.dns', {
      name: 'beryllium.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-boron.dns', {
      name: 'boron.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-carbon.dns', {
      name: 'carbon.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-haruka.dns', {
      name: 'haruka.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-helium.dns', {
      name: 'helium.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-hydrogen.dns', {
      name: 'hydrogen.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-lithium.dns', {
      name: 'lithium.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-neon.dns', {
      name: 'neon.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-nitrogen.dns', {
      name: 'nitrogen.dns',
      type: 'AAAA',
      content: '::',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-aaaa-v6.haruka.dns', {
      name: 'v6.haruka.dns',
      proxied: false,
      type: 'AAAA',
      content: '2400:2410:3800:2502:1e69:7aff:fea4:f698',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['content'])

    new Record(this, 'dns-caa-issuewild-le-ggrel.net', {
      data: {
        flags: '0',
        tag: 'issuewild',
        value: 'letsencrypt.org',
      },
      name: 'ggrel.net',
      type: 'CAA',
      zoneId: zone.id,
    })

    new Record(this, 'dns-caa-issue-le-ggrel.net', {
      data: {
        flags: '0',
        tag: 'issue',
        value: 'letsencrypt.org',
      },
      name: 'ggrel.net',
      type: 'CAA',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-auth', {
      name: 'auth',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-dtv', {
      name: 'dtv',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ggrel.net', {
      name: 'ggrel.net',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ma.cdn', {
      name: 'ma.cdn',
      proxied: true,
      type: 'CNAME',
      content: 'public.r2.dev',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-materia', {
      name: 'materia',
      proxied: false,
      type: 'CNAME',
      content: 'carbon.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-argocd.materia', {
      name: 'argocd.materia',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-hubble.materia', {
      name: 'hubble.materia',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-materia-cluster', {
      name: 'materia-cluster',
      proxied: false,
      type: 'CNAME',
      content: 'boron.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-miniflux', {
      name: 'miniflux',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-monitor', {
      name: 'monitor',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-sig1._domainkey', {
      name: 'sig1._domainkey',
      proxied: false,
      type: 'CNAME',
      content: 'sig1.dkim.ggrel.net.at.icloudmailadmin.com',
      zoneId: zone.id,
    }).importFrom(
      '8797b62049f417096e6bba991ebbbc6a/e37badbf4f3be26081159d2bdd273120',
    )

    new Record(this, 'dns-cname-ts', {
      name: 'ts',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-10-icloud-1', {
      name: 'ggrel.net',
      priority: 10,
      type: 'MX',
      content: 'mx01.mail.icloud.com',
      zoneId: zone.id,
    }).importFrom(
      '8797b62049f417096e6bba991ebbbc6a/5fd92c0383da1791f707c9d9065fbbda',
    )

    new Record(this, 'dns-mx-10-icloud-2', {
      name: 'ggrel.net',
      priority: 10,
      type: 'MX',
      content: 'mx02.mail.icloud.com',
      zoneId: zone.id,
    }).importFrom(
      '8797b62049f417096e6bba991ebbbc6a/ad8c5d36059369a6ca48428be255f715',
    )

    new Record(this, 'dns-txt-spf', {
      name: 'ggrel.net',
      type: 'TXT',
      content: 'v=spf1 include:icloud.com ~all',
      zoneId: zone.id,
    }).importFrom(
      '8797b62049f417096e6bba991ebbbc6a/38ad351d7e4124180c08cbe82366bab0',
    )

    new Record(this, 'dns-txt-icloud', {
      name: 'ggrel.net',
      type: 'TXT',
      content: 'apple-domain=3J9bInEzoF3qYmdl',
      zoneId: zone.id,
    }).importFrom(
      '8797b62049f417096e6bba991ebbbc6a/cf61568d37814ecffb04bcc2f2cb1368',
    )

    new Record(this, 'dns-txt-_dmarc', {
      name: '_dmarc',
      type: 'TXT',
      content: 'v=DMARC1; p=quarantine; adkim=s',
      zoneId: zone.id,
    })
  }
}
