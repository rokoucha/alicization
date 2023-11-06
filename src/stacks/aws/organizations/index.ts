import { OrganizationsAccount } from '@cdktf/provider-aws/lib/organizations-account/index.js'
import { Construct } from 'constructs'

export class Organizations extends Construct {
  rokoucha: OrganizationsAccount
  isucon13: OrganizationsAccount

  constructor(scope: Construct, id: string) {
    super(scope, id)

    this.rokoucha = new OrganizationsAccount(this, 'rokoucha', {
      name: 'rokoucha',
      email: 'esazeumo@8c7042.org',
    })

    this.isucon13 = new OrganizationsAccount(this, 'isucon13', {
      name: 'isucon13',
      email: 'yzwrnns1@8c7042.org',
    })
  }
}
