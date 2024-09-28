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

    new Record(this, 'dns-cname-grafana.materia', {
      name: 'grafana.materia',
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
      content: 'helium.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ts', {
      name: 'ts',
      proxied: false,
      type: 'CNAME',
      content: 'materia.ggrel.net',
      zoneId: zone.id,
    })
  }
}
