import { WorkerScript } from '@cdktf/provider-cloudflare/lib/worker-script'
import { Construct } from 'constructs'

export type OhBig7Config = Readonly<{
  accountId: string
}>

export class OhBig7 extends Construct {
  constructor(scope: Construct, id: string, config: OhBig7Config) {
    super(scope, id)

    new WorkerScript(this, 'oh-big-7', {
      accountId: config.accountId,
      content: '',
      module: true,
      name: 'oh-big-7',
    }).addOverride('lifecycle.ignore_changes', ['content'])
  }
}
