import { WorkerScript } from '@cdktf/provider-cloudflare/lib/worker-script/index.js'
import { Construct } from 'constructs'

export type IkaPriConfig = Readonly<{
  accountId: string
}>

export class IkaPri extends Construct {
  constructor(scope: Construct, id: string, config: IkaPriConfig) {
    super(scope, id)

    new WorkerScript(this, 'ikapri', {
      accountId: config.accountId,
      content: '',
      name: 'ikapri',
    }).addOverride('lifecycle.ignore_changes', ['content'])
  }
}
