import { Construct } from 'constructs'
import { GgrelNet } from './GgrelNet'
import { NoaPpUa } from './NoaPpUa'
import { RokouchaNet } from './RokouchaNet'
import { SaynWittgensteIn } from './SaynWittgensteIn'

export type ZonesConfig = Readonly<{
  accountId: string
}>

export class Zones extends Construct {
  constructor(scope: Construct, id: string, config: ZonesConfig) {
    super(scope, id)

    new GgrelNet(this, 'ggrel.net', {
      accountId: config.accountId,
    })

    new NoaPpUa(this, 'noa.pp.ua', {
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
