import { WorkerScript } from '@cdktf/provider-cloudflare/lib/worker-script/index.js'
import { Construct } from 'constructs'
import { readFile } from 'fs/promises'
import { escapeWorkerScript } from '../../../utils/workers.js'

const script = escapeWorkerScript(
  await readFile('./src/assets/workers/ikapri/dist/worker.js', {
    encoding: 'utf-8',
  }),
)

export type IkaPriConfig = Readonly<{
  accountId: string
}>

export class IkaPri extends Construct {
  constructor(scope: Construct, id: string, config: IkaPriConfig) {
    super(scope, id)

    new WorkerScript(this, 'ikapri', {
      accountId: config.accountId,
      content: script,
      name: 'ikapri',
    })
  }
}
