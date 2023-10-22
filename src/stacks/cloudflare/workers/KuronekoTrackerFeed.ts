import { WorkerScript } from '@cdktf/provider-cloudflare/lib/worker-script/index.js'
import { Construct } from 'constructs'

export type KuronekoTrackerFeedConfig = Readonly<{
  accountId: string
}>

export class KuronekoTrackerFeed extends Construct {
  constructor(scope: Construct, id: string, config: KuronekoTrackerFeedConfig) {
    super(scope, id)

    new WorkerScript(this, 'kuroneko-tracker-feed', {
      accountId: config.accountId,
      content: '',
      module: true,
      name: 'kuroneko-tracker-feed',
      plainTextBinding: [
        {
          name: 'BASE_URL',
          text: 'https://kuroneko-tracker-feed.rokoucha.workers.dev',
        },
        {
          name: 'KURONEKO_URL',
          text: 'https://toi.kuronekoyamato.co.jp/cgi-bin/tneko',
        },
        {
          name: 'VERSION',
          text: '2.0.0',
        },
      ],
    }).addOverride('lifecycle.ignore_changes', ['content'])
  }
}
