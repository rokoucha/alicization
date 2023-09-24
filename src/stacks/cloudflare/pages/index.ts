import { Construct } from 'constructs'
import { _8c7042Org } from './_8c7042-org.js'
import { CloudflarePagesFunctionsNextJs } from './cloudflare-pages-function-next-js.js'
import { Scienest } from './scienest.js'
import { SuperSeisan } from './super-seisan.js'
import { Tweet2Scrapbox } from './tweet2scrapbox.js'

export type PagesConfig = Readonly<{
  accountId: string
}>

export class Pages extends Construct {
  constructor(scope: Construct, id: string, config: PagesConfig) {
    super(scope, id)

    new _8c7042Org(this, '_8c7042-org', {
      accountId: config.accountId,
    })

    new CloudflarePagesFunctionsNextJs(
      this,
      'cloudflare-pages-function-next-js',
      {
        accountId: config.accountId,
      },
    )

    new Scienest(this, 'scienest', {
      accountId: config.accountId,
    })

    new SuperSeisan(this, 'super-seisan', {
      accountId: config.accountId,
    })

    new Tweet2Scrapbox(this, 'tweet2scrapbox', {
      accountId: config.accountId,
    })
  }
}
