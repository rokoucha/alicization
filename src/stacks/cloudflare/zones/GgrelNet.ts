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
      content: 'lithium.dns.ggrel.net',
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
      content: 'lithium.dns.ggrel.net',
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
    })

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
    })

    new Record(this, 'dns-mx-10-icloud-2', {
      name: 'ggrel.net',
      priority: 10,
      type: 'MX',
      content: 'mx02.mail.icloud.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-spf', {
      name: 'ggrel.net',
      type: 'TXT',
      content: 'v=spf1 include:icloud.com ~all',
      zoneId: zone.id,
    })
    new Record(this, 'dns-txt-icloud', {
      name: 'ggrel.net',
      type: 'TXT',
      content: 'apple-domain=3J9bInEzoF3qYmdl',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-_dmarc', {
      name: '_dmarc',
      type: 'TXT',
      content: 'v=DMARC1; p=quarantine; adkim=s',
      zoneId: zone.id,
    })
  }
}
