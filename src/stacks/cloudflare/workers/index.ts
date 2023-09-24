import { Construct } from 'constructs'
import { KuronekoTrackerFeed } from './KuronekoTrackerFeed.js'

export type WorkersConfig = Readonly<{
  accountId: string
}>

export class Workers extends Construct {
  constructor(scope: Construct, id: string, config: WorkersConfig) {
    super(scope, id)

    new KuronekoTrackerFeed(this, 'kuroneko-tracker-feed', {
      accountId: config.accountId,
    })
  }
}
