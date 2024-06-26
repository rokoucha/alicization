import { Record } from '@cdktf/provider-cloudflare/lib/record'
import { Zone } from '@cdktf/provider-cloudflare/lib/zone'
import { Construct } from 'constructs'

export type SaynWittgensteInConfig = Readonly<{
  accountId: string
}>

export class SaynWittgensteIn extends Construct {
  constructor(scope: Construct, id: string, config: SaynWittgensteInConfig) {
    super(scope, id)

    const zone = new Zone(this, 'zone', {
      accountId: config.accountId,
      zone: 'sayn-wittgenste.in',
    })

    new Record(this, 'dns-cname-heinrike.prinzessin.zu.sayn-wittgenste.in', {
      name: 'heinrike.prinzessin.zu',
      proxied: false,
      type: 'CNAME',
      value: 'sayn-wittgenste.in',
      zoneId: zone.id,
    })

    new Record(this, 'dns-cname-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      proxied: false,
      type: 'CNAME',
      value: 'helium.dns.ggrel.net',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-verification-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      priority: 10,
      type: 'MX',
      value:
        'qopfxxhethpfg6oj5ubrjxup5aayjzhcjd2tu2ejl4myv2xfsl7q.mx-verification.google.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-alt4-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      priority: 10,
      type: 'MX',
      value: 'alt4.aspmx.l.google.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-alt3-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      priority: 10,
      type: 'MX',
      value: 'alt3.aspmx.l.google.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-alt2-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      priority: 5,
      type: 'MX',
      value: 'alt2.aspmx.l.google.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-alt1-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      priority: 5,
      type: 'MX',
      value: 'alt1.aspmx.l.google.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-mx-1-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      priority: 1,
      type: 'MX',
      value: 'aspmx.l.google.com',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-_dmarc', {
      name: '_dmarc',
      type: 'TXT',
      value:
        'v=DMARC1; p=none; rua=mailto:heinrike.prinzessin.zu.sayn-wittgenste.in',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-google._domainkey', {
      name: 'google._domainkey',
      type: 'TXT',
      value:
        'v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArVbmlsyvPbqNdN9FMO+7h0vR0cmY8xXZS6kOV2+FIggaQ5jcR8KNnLvmjS5BS0JUv+l+yFjNlPuS0S6uKzYXplvDhNcp/WbbETcMv2jkIBVRWGa6ExZQBmF2iZEql5IiDfSlvQOfgrEsEJjqy5qYtHM6pmamNzoqBERN+xLldTr/NEaUr1AexzxJ5/15bY89isOLUj92RXdR5j8lpHUzx1WbVDhIUUF4ZftzRVfvrG+TMsYj2W3WaaiN230wd6KB6duBEBqTY5fCBYQmI5WjgT53QG8UEhi1ANEWmzrL9qyAiSDFjNkBIgFGrf1e0hDiM3TBWQVynys4cx5XznUAQQIDAQAB',
      zoneId: zone.id,
    })

    new Record(this, 'dns-txt-spf-sayn-wittgenste.in', {
      name: 'sayn-wittgenste.in',
      type: 'TXT',
      value: 'v=spf1 include:_spf.google.com ~all',
      zoneId: zone.id,
    })
  }
}
