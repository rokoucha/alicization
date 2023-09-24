import { Construct } from 'constructs'
import { Scienest } from './scienest.js'

export type PagesConfig = Readonly<{
  accountId: string
}>

export class Pages extends Construct {
  constructor(scope: Construct, id: string, config: PagesConfig) {
    super(scope, id)

    new Scienest(this, 'scienest', {
      accountId: config.accountId,
    })
  }
}
