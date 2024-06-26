import { Construct } from 'constructs'
import { GgrelNet } from './GgrelNet'
import { RokouchaNet } from './RokouchaNet'
import { SaynWittgensteIn } from './SaynWittgensteIn'
import { _8c7042 } from './_8c7042'

export type ZonesConfig = Readonly<{
  accountId: string
}>

export class Zones extends Construct {
  constructor(scope: Construct, id: string, config: ZonesConfig) {
    super(scope, id)

    new _8c7042(this, '_8c7042.org', {
      accountId: config.accountId,
    })

    new GgrelNet(this, 'ggrel.net', {
      accountId: config.accountId,
    })

    new RokouchaNet(this, 'rokoucha.net', {
      accountId: config.accountId,
    })

    new SaynWittgensteIn(this, 'sayn-wittgenste.in', {
      accountId: config.accountId,
    })
  }
}
