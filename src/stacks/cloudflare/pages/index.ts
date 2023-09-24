import { Construct } from 'constructs'
import { CloudflarePagesFunctionsNextJs } from './cloudflare-pages-function-next-js.js'
import { Scienest } from './scienest.js'

export type PagesConfig = Readonly<{
  accountId: string
}>

export class Pages extends Construct {
  constructor(scope: Construct, id: string, config: PagesConfig) {
    super(scope, id)

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
  }
}
