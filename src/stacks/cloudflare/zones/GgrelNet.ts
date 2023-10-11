import { Record } from '@cdktf/provider-cloudflare/lib/record/index.js'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone/index.js'
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
      value: '172.16.2.21',
      zoneId: zone.id,
    })

    new Record(this, 'dns-a-nginx_stats', {
      name: 'nginx_stats',
      type: 'A',
      value: '172.16.2.11',
      zoneId: zone.id,
    })

    new Record(this, 'dns-a-shizuka.dns', {
      name: 'shizuka.dns',
      type: 'A',
      value: '172.16.2.12',
      zoneId: zone.id,
    })

    new Record(this, 'dns-a-tomoko.dns', {
      name: 'tomoko.dns',
      proxied: false,
      type: 'A',
      value: '60.117.38.230',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-a-v4.tomoko.dns', {
      name: 'v4.tomoko.dns',
      proxied: false,
      type: 'A',
      value: '60.117.38.230',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-a-vesna.dns', {
      name: 'vesna.dns',
      type: 'A',
      value: '172.16.2.13',
      zoneId: zone.id,
    })

    new Record(this, 'dns-aaaa-adolfine.dns', {
      name: 'adolfine.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:9296:f3ff:fe4a:42b2',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-aaaa-haruka.dns', {
      name: 'haruka.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:1e69:7aff:fea4:f698',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-aaaa-shizuka.dns', {
      name: 'shizuka.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:20c:29ff:fef2:ad28',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-aaaa-tomoko.dns', {
      name: 'tomoko.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:20c:29ff:feb8:aa81',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-aaaa-v6.haruka.dns', {
      name: 'v6.haruka.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:1e69:7aff:fea4:f698',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-aaaa-v6.shizuka.dns', {
      name: 'v6.shizuka.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:20c:29ff:fef2:ad28',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-aaaa-v6.tomoko.dns', {
      name: 'v6.tomoko.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:20c:29ff:feb8:aa81',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

    new Record(this, 'dns-aaaa-vesna.dns', {
      name: 'vesna.dns',
      proxied: false,
      type: 'AAAA',
      value: '2400:2410:3800:2502:20c:29ff:fe21:a0d9',
      zoneId: zone.id,
    }).addOverride('lifecycle.ignore_changes', ['value'])

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
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ggrel.net', {
      name: 'ggrel.net',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ilmestys', {
      name: 'ilmestys',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ma.cdn', {
      name: 'ma.cdn',
      proxied: true,
      type: 'CNAME',
      value: 'public.r2.dev',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-miniflux', {
      name: 'miniflux',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-monitor', {
      name: 'monitor',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-ts', {
      name: 'ts',
      proxied: false,
      type: 'CNAME',
      value: 'tomoko.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-keybase-ggrel.net', {
      name: 'ggrel.net',
      type: 'TXT',
      value:
        'keybase-site-verification=iGg5bp5rxxOnX_KQXAyCVPMULZ_zrJcAG5vZ95xTLOc',
      zoneId: zone.id,
    })
  }
}
