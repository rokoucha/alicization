import { Construct } from 'constructs'
import { IkaPri } from './IkaPri'
import { KuronekoTrackerFeed } from './KuronekoTrackerFeed'
import { OhBig7 } from './OhBig7'

export type WorkersConfig = Readonly<{
  accountId: string
}>

export class Workers extends Construct {
  constructor(scope: Construct, id: string, config: WorkersConfig) {
    super(scope, id)

    new IkaPri(this, 'ikapri', {
      accountId: config.accountId,
    })

    new KuronekoTrackerFeed(this, 'kuroneko-tracker-feed', {
      accountId: config.accountId,
    })

    new OhBig7(this, 'oh-big-7', {
      accountId: config.accountId,
    })
  }
}
