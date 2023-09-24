import { WorkerScript } from '@cdktf/provider-cloudflare/lib/worker-script/index.js'
import { Construct } from 'constructs'

export type WorkersConfig = Readonly<{
  accountId: string
}>

export class Workers extends Construct {
  constructor(scope: Construct, id: string, config: WorkersConfig) {
    super(scope, id)

    new WorkerScript(this, 'scienest', {
      accountId: config.accountId,
      content: '',
      name: 'scienest',
    })
  }
}
