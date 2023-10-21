import { WorkerScript } from '@cdktf/provider-cloudflare/lib/worker-script/index.js'
import { Construct } from 'constructs'
import { readFile } from 'fs/promises'
import { escapeWorkerScript } from '../../../utils/workers.js'

const script = escapeWorkerScript(
  await readFile('./src/assets/workers/kuroneko-tracker-feed/dist/index.mjs', {
    encoding: 'utf-8',
  }),
)

export type KuronekoTrackerFeedConfig = Readonly<{
  accountId: string
}>

export class KuronekoTrackerFeed extends Construct {
  constructor(scope: Construct, id: string, config: KuronekoTrackerFeedConfig) {
    super(scope, id)

    new WorkerScript(this, 'kuroneko-tracker-feed', {
      accountId: config.accountId,
      content: script,
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
    })
  }
}
