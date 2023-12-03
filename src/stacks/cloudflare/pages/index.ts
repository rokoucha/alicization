import { Construct } from 'constructs'
import { AuthJsCloudflarePagesFunctions } from './AuthJsCloudflarePagesFunctions.js'
import { CloudflarePagesFunctionsNextJs } from './CloudflarePagesFunctioNextJs.js'
import { Cwskk } from './Cwskk.js'
import { PetaPeta } from './PetaPeta.js'
import { Scienest } from './Scienest.js'
import { SuperSeisan } from './SuperSeisan.js'
import { Tweet2Scrapbox } from './Tweet2Scrapbox.js'
import { _8c7042Org } from './_8c7042Org.js'

export type PagesConfig = Readonly<{
  accountId: string
}>

export class Pages extends Construct {
  constructor(scope: Construct, id: string, config: PagesConfig) {
    super(scope, id)

    new _8c7042Org(this, '_8c7042-org', {
      accountId: config.accountId,
    })

    new AuthJsCloudflarePagesFunctions(
      this,
      'auth-js-cloudflare-pages-functions',
      {
        accountId: config.accountId,
      },
    )

    new CloudflarePagesFunctionsNextJs(
      this,
      'cloudflare-pages-function-next-js',
      {
        accountId: config.accountId,
      },
    )

    new Cwskk(this, 'cwskk', {
      accountId: config.accountId,
    })

    new PetaPeta(this, 'petapeta', {
      accountId: config.accountId,
    })

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
