import { Construct } from 'constructs'
import { AuthJsCloudflarePagesFunctions } from './AuthJsCloudflarePagesFunctions'
import { CloudflarePagesFunctionsNextJs } from './CloudflarePagesFunctioNextJs'
import { Cwskk } from './Cwskk'
import { Gjx } from './Gjx'
import { PetaPeta } from './PetaPeta'
import { Scienest } from './Scienest'
import { SuperSeisan } from './SuperSeisan'
import { Tweet2Scrapbox } from './Tweet2Scrapbox'
import { _8c7042Org } from './_8c7042Org'

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

    new Gjx(this, 'gjx', {
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
